#!/usr/bin/env python3
"""Check a Jekyll build for missing assets, internal links, and SEO metadata.

Usage: python3 scripts/audit_site.py /tmp/daeunworld-build --check-remote
Requires Python 3 and curl only. Does not edit the build or source files.
"""
import argparse
from collections import Counter
from concurrent.futures import ThreadPoolExecutor
from html.parser import HTMLParser
import json
from pathlib import Path
import subprocess
from urllib.parse import quote, unquote, urljoin, urlsplit


class Page(HTMLParser):
    def __init__(self, text):
        super().__init__()
        self.images, self.links, self.canonicals, self.body_images = [], [], [], []
        self.meta = {}
        self.body_depth = 0
        self.feed(text)

    def handle_starttag(self, tag, attrs):
        attrs = dict(attrs)
        if tag == 'div':
            if self.body_depth:
                self.body_depth += 1
            elif 'post-content' in attrs.get('class', '').split():
                self.body_depth = 1
        if tag == 'img':
            self.images.append(attrs)
            if self.body_depth:
                self.body_images.append(attrs)
        if tag == 'a' and attrs.get('href'):
            self.links.append(attrs['href'])
        if tag == 'link' and attrs.get('rel') == 'canonical':
            self.canonicals.append(attrs.get('href', ''))
        if tag == 'meta':
            self.meta[attrs.get('name', attrs.get('property', ''))] = attrs.get('content', '')

    def handle_endtag(self, tag):
        if tag == 'div' and self.body_depth:
            self.body_depth -= 1


def normalized(url):
    # Retain escaped slashes, encode Unicode/spaces, and avoid curl globbing.
    return quote(url, safe=":/?&=#%+;,@!$'()*[]~-_")


def check_remote(url):
    def request(head):
        command = ['curl', '--globoff', '--silent', '--show-error', '--location',
                   '--max-time', '25', '--connect-timeout', '10', '--output', '/dev/null',
                   '--write-out', '%{http_code}\t%{content_type}']
        if head:
            command.append('--head')
        result = subprocess.run(command + [normalized(url)], capture_output=True, text=True)
        status, _, content_type = result.stdout.partition('\t')
        return result.returncode, status, content_type, result.stderr.strip()
    code, status, content_type, error = request(True)
    if code or status not in ('200', '206') or not content_type.startswith('image/'):
        code, status, content_type, error = request(False)
    return {'url': url, 'status': status, 'content_type': content_type,
            'ok': code == 0 and status in ('200', '206') and content_type.startswith('image/'),
            'error': error}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('site', type=Path)
    parser.add_argument('--base-url', default='https://daeunworld.xyz/')
    parser.add_argument('--check-remote', action='store_true')
    parser.add_argument('--output', type=Path, help='Optional JSON report path outside the site build')
    args = parser.parse_args()
    root = args.site.resolve()
    if not (root / 'index.html').is_file():
        parser.error('site must be a completed Jekyll build with index.html')
    base = args.base_url.rstrip('/') + '/'
    host = urlsplit(base).netloc
    errors, warnings, remote = [], Counter(), set()
    posts = images = pages = 0
    descriptions = Counter()
    for file in sorted(root.rglob('*.html')):
        relative = file.relative_to(root).as_posix()
        url = urljoin(base, relative[:-10] if relative.endswith('index.html') else relative)
        page = Page(file.read_text(encoding='utf-8'))
        pages += 1
        is_post = page.meta.get('og:type') == 'article'
        if is_post:
            posts += 1
            for field in ('description', 'og:image'):
                if not page.meta.get(field):
                    errors.append({'page': url, 'kind': 'missing_metadata', 'field': field})
            if len(page.canonicals) != 1 or unquote(page.canonicals[0]) != unquote(url):
                errors.append({'page': url, 'kind': 'invalid_canonical', 'values': page.canonicals})
            descriptions[page.meta.get('description', '')] += 1
        for img in page.body_images:
            images += 1
            warnings['missing_or_empty_alt'] += not bool(img.get('alt'))
            warnings['generic_alt'] += img.get('alt', '').lower() in ('image', 'img', '이미지')
            warnings['missing_dimensions'] += not bool(img.get('width') and img.get('height'))
            warnings['without_lazy_loading'] += img.get('loading') != 'lazy'
        refs = [('image', img.get('src', '')) for img in page.images]
        refs += [('link', href) for href in page.links]
        refs += [('image', page.meta.get(key, '')) for key in ('og:image', 'twitter:image')]
        for kind, raw in refs:
            if not raw or raw.startswith(('#', 'data:', 'mailto:', 'tel:', 'javascript:')):
                continue
            resolved = urljoin(url, raw)
            parsed = urlsplit(resolved)
            if parsed.scheme not in ('http', 'https'):
                continue
            if parsed.netloc != host:
                if kind == 'image':
                    remote.add(resolved)
                continue
            target = root / unquote(parsed.path).lstrip('/')
            if not target.is_file() and not (target / 'index.html').is_file():
                errors.append({'page': url, 'kind': 'missing_' + kind, 'url': resolved})
    remote_results = []
    if args.check_remote:
        with ThreadPoolExecutor(max_workers=8) as pool:
            remote_results = list(pool.map(check_remote, sorted(remote)))
        errors.extend({'kind': 'remote_image', **result} for result in remote_results if not result['ok'])
    summary = {'pages': pages, 'posts': posts, 'body_images': images,
               'remote_image_urls': len(remote), 'remote_images_checked': len(remote_results),
               'errors': len(errors), 'warnings': dict(warnings),
               'duplicate_description_groups': sum(count > 1 for count in descriptions.values())}
    report = {'summary': summary, 'errors': errors, 'remote_images': remote_results}
    if args.output:
        args.output.write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    print(json.dumps(summary, ensure_ascii=False, indent=2))
    for error in errors:
        print(json.dumps(error, ensure_ascii=False))
    return 1 if errors else 0


if __name__ == '__main__':
    raise SystemExit(main())

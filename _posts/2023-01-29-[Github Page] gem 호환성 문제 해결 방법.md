---
layout: post
title: [Github Page] gem 호환성 문제 해결 방법
subheading: 깃헙페이지 gem 버전 안맞음 오류
author: Daeun
categories: Game
banner:
tags: 깃헙페이지 github_page gem ruby gem버전
sidebar: []
---

## gem 버전 호환성 문제란?
```
PS C:\Programing\hanalum-dev.github.io> bundle install
Fetching gem metadata from https://rubygems.org/...........
Fetching gem metadata from https://rubygems.org/.
Resolving dependencies...
nokogiri-1.10.9-x64-mingw32 requires ruby version < 2.7.dev, >= 2.3, which is
incompatible with the current version, ruby 2.7.7p221
```
Ruby버전과 gem에서 요구하는 Ruby버전이 맞지 않는 경우

## gem 버전 호환성 문제 해결 방법은?
```
PS C:\Programing\hanalum-dev.github.io> bundle install
Fetching gem metadata from https://rubygems.org/...........
Fetching gem metadata from https://rubygems.org/.
You have requested:
  nokogiri ~> 1.13, >= 1.13.10

The bundle currently has nokogiri locked at 1.10.9.
Try running `bundle update nokogiri`

If you are updating multiple gems in your Gemfile at once,
try passing them all to `bundle update`
```
에러 메세지의 안내에 따라 `bundle update`를 쳐보자.
```
PS C:\Programing\hanalum-dev.github.io> bundle update nokogiri
Fetching gem metadata from https://rubygems.org/...........
Fetching gem metadata from https://rubygems.org/.
Resolving dependencies...
Using rake 13.0.1
Using concurrent-ruby 1.1.8
Using i18n 1.8.10
Using minitest 5.14.0
Using thread_safe 0.3.6
Using tzinfo 1.2.9
Using zeitwerk 2.3.0
Using activesupport 6.0.2.2
Using builder 3.2.4
Using erubi 1.9.0
Using racc 1.6.1
Using nokogiri 1.13.10 (x64-mingw32) (was 1.10.9)
Fetching rails-dom-testing 2.0.3
Installing rails-dom-testing 2.0.3
Fetching crass 1.0.6
Installing crass 1.0.6
Fetching loofah 2.5.0
Installing loofah 2.5.0
Fetching rails-html-sanitizer 1.3.0
Installing rails-html-sanitizer 1.3.0
Fetching actionview 6.0.2.2
Installing actionview 6.0.2.2
Fetching rack 2.2.2
Installing rack 2.2.2
Fetching rack-test 1.1.0
Installing rack-test 1.1.0
Fetching actionpack 6.0.2.2
Installing actionpack 6.0.2.2
Fetching public_suffix 4.0.6
Installing public_suffix 4.0.6
Fetching addressable 2.7.0
Installing addressable 2.7.0
Fetching execjs 2.7.0
Installing execjs 2.7.0
Fetching autoprefixer-rails 9.7.5
Installing autoprefixer-rails 9.7.5
Fetching popper_js 1.16.0
Installing popper_js 1.16.0
Fetching method_source 1.0.0
Installing method_source 1.0.0
Fetching thor 1.0.1
Installing thor 1.0.1
Fetching railties 6.0.2.2
Installing railties 6.0.2.2
Fetching ffi 1.15.0 (x64-mingw32)
Installing ffi 1.15.0 (x64-mingw32)
Using sassc 2.4.0 (x64-mingw32)
Fetching sprockets 4.0.0
Installing sprockets 4.0.0
Fetching sprockets-rails 3.2.1
Installing sprockets-rails 3.2.1
Fetching tilt 2.0.10
Installing tilt 2.0.10
Fetching sassc-rails 2.1.2
Installing sassc-rails 2.1.2
Fetching bootstrap 4.4.1
Installing bootstrap 4.4.1
Using bundler 1.17.2
Using colorator 1.1.0
Using eventmachine 1.2.7 (x64-mingw32)
Fetching http_parser.rb 0.6.0
Installing http_parser.rb 0.6.0 with native extensions
Fetching em-websocket 0.5.2
Installing em-websocket 0.5.2
Using forwardable-extended 2.6.0
Fetching jekyll-sass-converter 2.1.0
Installing jekyll-sass-converter 2.1.0
Fetching rb-fsevent 0.10.4
Installing rb-fsevent 0.10.4
Using rb-inotify 0.10.1
Fetching listen 3.5.1
Installing listen 3.5.1
Using jekyll-watch 2.2.1
Using rexml 3.2.5
Fetching kramdown 2.3.1
Installing kramdown 2.3.1
Using kramdown-parser-gfm 1.1.0
Using liquid 4.0.3
Using mercenary 0.4.0
Fetching rouge 3.26.0
Installing rouge 3.26.0
Using safe_yaml 1.0.5
Fetching unicode-display_width 1.7.0
Installing unicode-display_width 1.7.0
Fetching terminal-table 2.0.0
Installing terminal-table 2.0.0
Fetching jekyll 4.2.0
Installing jekyll 4.2.0
Fetching jekyll-archives 2.2.1
Installing jekyll-archives 2.2.1
Fetching jekyll-feed 0.15.1
Installing jekyll-feed 0.15.1
Fetching jekyll-figure 0.1.0
Installing jekyll-figure 0.1.0
Using jekyll-paginate 1.1.0
Fetching jekyll-seo-tag 2.7.1
Installing jekyll-seo-tag 2.7.1
Using jekyll-sitemap 1.4.0
Using wdm 0.1.1
Bundle updated!
```
gem 버전 호환성 문제가 해결되었다!

이제 다시 `bundle install`을 하면 정상적으로 작동하는 모습을 볼 수 있다.
```
PS C:\Programing\hanalum-dev.github.io> bundle install
Using rake 13.0.1
Using concurrent-ruby 1.1.8
Using i18n 1.8.10
Using minitest 5.14.0
Using thread_safe 0.3.6
Using tzinfo 1.2.9
Using zeitwerk 2.3.0
Using activesupport 6.0.2.2
Using builder 3.2.4
Using erubi 1.9.0
Using racc 1.6.1
Using nokogiri 1.13.10 (x64-mingw32)
Using rails-dom-testing 2.0.3
Using crass 1.0.6
Using loofah 2.5.0
Using rails-html-sanitizer 1.3.0
Using actionview 6.0.2.2
Using rack 2.2.2
Using rack-test 1.1.0
Using actionpack 6.0.2.2
Using public_suffix 4.0.6
Using addressable 2.7.0
Using execjs 2.7.0
Using autoprefixer-rails 9.7.5
Using popper_js 1.16.0
Using method_source 1.0.0
Using thor 1.0.1
Using railties 6.0.2.2
Using ffi 1.15.0 (x64-mingw32)
Using sassc 2.4.0 (x64-mingw32)
Using sprockets 4.0.0
Using sprockets-rails 3.2.1
Using tilt 2.0.10
Using sassc-rails 2.1.2
Using bootstrap 4.4.1
Using bundler 1.17.2
Using colorator 1.1.0
Using eventmachine 1.2.7 (x64-mingw32)
Using http_parser.rb 0.6.0
Using em-websocket 0.5.2
Using forwardable-extended 2.6.0
Using jekyll-sass-converter 2.1.0
Using rb-fsevent 0.10.4
Using rb-inotify 0.10.1
Using jekyll-watch 2.2.1
Using rexml 3.2.5
Using kramdown 2.3.1
Using kramdown-parser-gfm 1.1.0
Using liquid 4.0.3
Using mercenary 0.4.0
Using pathutil 0.16.2
Using rouge 3.26.0
Using safe_yaml 1.0.5
Using unicode-display_width 1.7.0
Using terminal-table 2.0.0
Using jekyll 4.2.0
Using jekyll-archives 2.2.1
Using jekyll-figure 0.1.0
Using jekyll-seo-tag 2.7.1
Using jekyll-sitemap 1.4.0
Using wdm 0.1.1
Bundle complete! 11 Gemfile dependencies, 64 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
```



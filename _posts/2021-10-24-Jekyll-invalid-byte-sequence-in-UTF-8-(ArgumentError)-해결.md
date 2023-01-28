---
layout: post
title: Jekyll invalid byte sequence in UTF-8 (ArgumentError) 해결
subheading: Ruby에서 jekyll serve명령 시 인코딩 오류 발생
author: Daeun
categories: Github_Page
banner:
tags: GithubPage Ruby Jekyll
sidebar: []
---

Github Page에 Jekyll 테마를 적용해나가다가 웹 구동을 위해
`jekyll serve`를 쳤더니 아래와 같이 오류가 났다.

## invalid byte sequence in UTF-8 (ArgumentError)에러 내용
{% highlight ruby %}
    C:/Ruby30-x64/lib/ruby/3.0.0/pathname.rb:50:in `match?': invalid byte sequence in UTF-8 (ArgumentError)
    from C:/Ruby30-x64/lib/ruby/3.0.0/pathname.rb:50:in `chop_basename'
    from C:/Ruby30-x64/lib/ruby/3.0.0/pathname.rb:374:in `plus'
    from C:/Ruby30-x64/lib/ruby/3.0.0/pathname.rb:354:in `+'
    from C:/Ruby30-x64/lib/ruby/3.0.0/pathname.rb:420:in `join'
    from C:/Ruby30-x64/lib/ruby/gems/3.0.0/gems/bundler-2.2.29/lib/bundler/settings.rb:444:in `global_config_file'
    from C:/Ruby30-x64/lib/ruby/gems/3.0.0/gems/bundler-2.2.29/lib/bundler/settings.rb:93:in `initialize'
    from C:/Ruby30-x64/lib/ruby/gems/3.0.0/gems/bundler-2.2.29/lib/bundler.rb:330:in `new'
    from C:/Ruby30-x64/lib/ruby/gems/3.0.0/gems/bundler-2.2.29/lib/bundler.rb:330:in `settings'
    from C:/Ruby30-x64/lib/ruby/gems/3.0.0/gems/bundler-2.2.29/lib/bundler.rb:99:in `configured_bundle_path'
    from C:/Ruby30-x64/lib/ruby/gems/3.0.0/gems/bundler-2.2.29/lib/bundler.rb:95:in `bundle_path'
    from C:/Ruby30-x64/lib/ruby/gems/3.0.0/gems/bundler-2.2.29/lib/bundler.rb:639:in `configure_gem_home_and_path'
    from C:/Ruby30-x64/lib/ruby/gems/3.0.0/gems/bundler-2.2.29/lib/bundler.rb:81:in `configure'
    from C:/Ruby30-x64/lib/ruby/gems/3.0.0/gems/bundler-2.2.29/lib/bundler.rb:194:in `definition'
    from C:/Ruby30-x64/lib/ruby/gems/3.0.0/gems/bundler-2.2.29/lib/bundler.rb:143:in `setup'
    from C:/Ruby30-x64/lib/ruby/gems/3.0.0/gems/jekyll-4.2.1/lib/jekyll/plugin_manager.rb:52:in `require_from_bundler'
    from C:/Ruby30-x64/lib/ruby/gems/3.0.0/gems/jekyll-4.2.1/exe/jekyll:11:in `<top (required)>'
    from C:/Ruby30-x64/bin/jekyll:23:in `load'
    from C:/Ruby30-x64/bin/jekyll:23:in `<main>'
{% endhighlight %}

## invalid byte sequence in UTF-8 (ArgumentError) 에러 원인과 해결 과정
프로젝트 폴더에 있던 gemfile의 인코딩 방식이 문제였던 것 같다. 그냥 gemfile 파일 자체를 삭제해보고 다시 명령어를 입력하니 정상작동했다. 

거의 한 3시간동안 구글링을 해본 결과 자료가 많지 않은 걸 보니 흔하게 발생하는 오류는 아닌듯하다. 내 시간만 아까울 뿐.....
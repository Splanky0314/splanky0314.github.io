---
layout: post
title: Github Page를 위한 Ruby와 Jekyll 세팅하기
subheading: 나만의 github page를 만들어 보자
author: Daeun
categories: Static_Web_Page
banner:
tags: GithubPage ruby jekyll web
sidebar: []
---
# Github Page만들기 - Ruby와 Jekyll 세팅 방법

## Install Ruby

https://rubyinstaller.org/downloads/
위 링크에서 Ruby를 다운받는다.

## Install
터미널에서
```cmd
gem install jekyll bundler
```
를 입력한다.

## 작동 확인하기
```
jekyll serve
```
를 입력했을 때, 

만약 아래와 같은 에러가 뜨는 경우에는,
(에러가 발생하지 않는 다면 스크롤을 내려 보자.)
```
C:\Programing\DaeunWorld>jekyll serve
Configuration file: C:/Programing/DaeunWorld/_config.yml
  Dependency Error: Yikes! It looks like you don't have jekyll-sitemap or one of its dependencies installed. In order to use Jekyll as currently configured, you'll need to install this gem. If you've run Jekyll with `bundle exec`, ensure that you have included the jekyll-sitemap gem in your Gemfile as well. The full error message from Ruby is: 'cannot load such file -- jekyll-sitemap' If you run into trouble, you can find helpful resources 
at https://jekyllrb.com/help/!
                    ------------------------------------------------
      Jekyll 4.2.1   Please append `--trace` to the `serve` command 
                     for any additional information or backtrace. 
                    ------------------------------------------------
Traceback (most recent call last):
        22: from C:/Ruby27-x64/bin/jekyll:23:in `<main>'
        21: from C:/Ruby27-x64/bin/jekyll:23:in `load'
        20: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/jekyll-4.2.1/exe/jekyll:15:in `<top (required)>'       
        19: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/mercenary-0.4.0/lib/mercenary.rb:21:in `program'       
        18: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/mercenary-0.4.0/lib/mercenary/program.rb:44:in `go'    
        17: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/mercenary-0.4.0/lib/mercenary/command.rb:221:in `execute'
        16: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/mercenary-0.4.0/lib/mercenary/command.rb:221:in `each' 
        15: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/mercenary-0.4.0/lib/mercenary/command.rb:221:in `block 
in execute'
        14: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/jekyll-4.2.1/lib/jekyll/commands/serve.rb:86:in `block 
(2 levels) in init_with_program'
        13: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/jekyll-4.2.1/lib/jekyll/command.rb:91:in `process_with_graceful_fail'
        12: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/jekyll-4.2.1/lib/jekyll/command.rb:91:in `each'        
        11: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/jekyll-4.2.1/lib/jekyll/command.rb:91:in `block in process_with_graceful_fail'
        10: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/jekyll-4.2.1/lib/jekyll/commands/build.rb:30:in `process'
         9: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/jekyll-4.2.1/lib/jekyll/commands/build.rb:30:in `new'  
         8: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/jekyll-4.2.1/lib/jekyll/site.rb:36:in `initialize'     
         7: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/jekyll-4.2.1/lib/jekyll/site.rb:131:in `setup'
         6: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/jekyll-4.2.1/lib/jekyll/plugin_manager.rb:22:in `conscientious_require'
         5: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/jekyll-4.2.1/lib/jekyll/plugin_manager.rb:30:in `require_gems'
         4: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/jekyll-4.2.1/lib/jekyll/external.rb:57:in `require_with_graceful_fail'
         3: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/jekyll-4.2.1/lib/jekyll/external.rb:57:in `each'       
         2: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/jekyll-4.2.1/lib/jekyll/external.rb:60:in `block in require_with_graceful_fail'
         1: from C:/Ruby27-x64/lib/ruby/2.7.0/rubygems/core_ext/kernel_require.rb:83:in `require'
C:/Ruby27-x64/lib/ruby/2.7.0/rubygems/core_ext/kernel_require.rb:83:in `require': cannot load such file -- jekyll-sitemap (LoadError)
        21: from C:/Ruby27-x64/bin/jekyll:23:in `<main>'
        20: from C:/Ruby27-x64/bin/jekyll:23:in `load'
        19: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/jekyll-4.2.1/exe/jekyll:15:in `<top (required)>'       
        18: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/mercenary-0.4.0/lib/mercenary.rb:21:in `program'       
        17: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/mercenary-0.4.0/lib/mercenary/program.rb:44:in `go'    
        16: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/mercenary-0.4.0/lib/mercenary/command.rb:221:in `execute'
        15: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/mercenary-0.4.0/lib/mercenary/command.rb:221:in `each' 
        14: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/mercenary-0.4.0/lib/mercenary/command.rb:221:in `block 
in execute'
        13: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/jekyll-4.2.1/lib/jekyll/commands/serve.rb:86:in `block 
(2 levels) in init_with_program'
        12: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/jekyll-4.2.1/lib/jekyll/command.rb:91:in `process_with_graceful_fail'
        11: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/jekyll-4.2.1/lib/jekyll/command.rb:91:in `each'        
        10: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/jekyll-4.2.1/lib/jekyll/command.rb:91:in `block in process_with_graceful_fail'
         9: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/jekyll-4.2.1/lib/jekyll/commands/build.rb:30:in `process'
         8: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/jekyll-4.2.1/lib/jekyll/commands/build.rb:30:in `new'  
         7: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/jekyll-4.2.1/lib/jekyll/site.rb:36:in `initialize'     
         6: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/jekyll-4.2.1/lib/jekyll/site.rb:131:in `setup'
         5: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/jekyll-4.2.1/lib/jekyll/plugin_manager.rb:22:in `conscientious_require'
         4: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/jekyll-4.2.1/lib/jekyll/plugin_manager.rb:30:in `require_gems'
         3: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/jekyll-4.2.1/lib/jekyll/external.rb:57:in `require_with_graceful_fail'
         2: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/jekyll-4.2.1/lib/jekyll/external.rb:57:in `each'       
         1: from C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/jekyll-4.2.1/lib/jekyll/external.rb:58:in `block in require_with_graceful_fail'
C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/jekyll-4.2.1/lib/jekyll/external.rb:73:in `rescue in block in require_with_graceful_fail': jekyll-sitemap (Jekyll::Errors::MissingDependencyException)
```

**require_with_graceful_fail': jekyll-sitemap (Jekyll::Errors::MissingDependencyException)** 부분을 보아야 하는데, 
jekyll-sitemap이 없어서 발생하는 오류이다. 따라서 이 오류를 해결하기 위해서는 
```
gem install jekyll-sitemap
```
이러한 방식으로 일일이 하나하나 없는 정보를 깔아주고
```
jekyll serve
```
를 다시 실행시키기를 반복하며 필요한 모든 파일을 다운받아야 한다.

추가로
``` Could not find mini_portile2-2.4.0 in any of the sources (Bundler::GemNotFound) ``` 처럼 특정 버전을 다운받아야 하는 경우

``` gem install mini_portile2 -v 2.4.0```의 형식으로 명령하면 된다.

또 추가로 이러한 방식으로 파일을 계속 깔다 보면 현재 나의 Ruby버전에서 다운로드가 불가능한 gem이 있기도 하다. 이러한 경우에는 
```
gem install nokogiri -v 1.10.9 --platform=ruby
```
과 같이 --platform=ruby 설정을 덧붙여 해결할 수 있다.
~~이거 찾느라 얼마나 시간을 들였는지...............~~

## Finish~!
만약 모두 다운이 완료되고 정상 실행되었다면
```
 Auto-regeneration: enabled for 'C:/Programing/DaeunWorld'
    Server address: http://127.0.0.1:4000/
  Server running... press ctrl-c to stop.
```
이 나타날 것이다. 

또 혹시 
```
C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/bundler-1.17.2/lib/bundler/runtime.rb:319:in `check_for_activated_spec!': You have already activated concurrent-ruby 1.1.9, but your Gemfile requires concurrent-ruby 1.1.8. Prepending `bundle exec` to your command may solve this. (Gem::LoadError)
```
같은 에러가 뜬다면 
```bundle exec jekyll serve```로 다시 해보면 될 것이다.

끝~~~~

이번에 컴퓨터를 초기화하면서 jekyll을 이용한 github page 개발을 위해 다시 ruby와 개발 환경을 세팅해보았다. 초기화하니까 컴퓨터가 깨끗하니 좋다. 그런데 갑자기 도대체 왜 멀쩡해야 되는 블루투스 드라이버가 말썽인지 블루투스가 안된다.... 삽질을 준비하자..........
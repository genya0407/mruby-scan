# mruby-scan   [![build](https://github.com/genya0407/mruby-scan/actions/workflows/ci.yml/badge.svg)](https://github.com/genya0407/mruby-scan/actions/workflows/ci.yml)
Scan class
## install by mrbgems
- add conf.gem line to `build_config.rb`

```ruby
MRuby::Build.new do |conf|

    # ... (snip) ...

    conf.gem :github => 'genya0407/mruby-scan'
end
```
## example
```ruby
p Scan.hi
#=> "hi!!"
t = Scan.new "hello"
p t.hello
#=> "hello"
p t.bye
#=> "hello bye"
```

## License
under the MIT License:
- see LICENSE file

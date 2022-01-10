MRuby::Build.new do |conf|
  toolchain :gcc
  conf.gembox 'default'
  conf.gem github: 'ksss/mruby-stringio'
  conf.gem github: 'fastly/mruby-optparse'
  conf.gem core: 'mruby-string-ext'
  conf.gem github: 'mattn/mruby-onig-regexp'
  conf.gem core: 'mruby-struct'
  conf.gem File.expand_path(File.dirname(__FILE__))
  conf.enable_test

  if ENV['DEBUG'] == 'true'
    conf.enable_debug
    conf.cc.defines = %w(MRB_ENABLE_DEBUG_HOOK)
    conf.gem core: 'mruby-bin-debugger'
  end
end

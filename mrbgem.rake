MRuby::Gem::Specification.new('mruby-scan') do |spec|
  spec.bins = ['scan']
  spec.license = 'MIT'
  spec.authors = 'Yusuke Sangenya'

  spec.add_dependency 'mruby-optparse', github: 'fastly/mruby-optparse'
  spec.add_dependency 'mruby-string-ext'
end

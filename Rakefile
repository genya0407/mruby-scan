MRUBY_CONFIG=File.expand_path(ENV["MRUBY_CONFIG"] || ".actions_config.rb")
MRUBY_VERSION=ENV["MRUBY_VERSION"] || "3.0.0"

file :mruby do
  sh "git clone --depth=1 https://github.com/mruby/mruby.git"
  if MRUBY_VERSION != 'master'
    Dir.chdir 'mruby' do
      sh "git fetch --tags"
      rev = %x{git rev-parse #{MRUBY_VERSION}}
      sh "git checkout #{rev}"
    end
  end
end

desc "compile binary"
task :compile => :mruby do
  sh "cd mruby && rake all MRUBY_CONFIG=#{MRUBY_CONFIG}"
end

desc "test"
task :test => :mruby do
  sh "cd mruby && rake all test MRUBY_CONFIG=#{MRUBY_CONFIG}"
end

desc "cleanup"
task :clean do
  exit 0 unless File.directory?('mruby')
  sh "cd mruby && rake deep_clean"
end

desc "generate release note"
task :generate_release_note do
  require 'erb'
  
  prev_ref = ENV.fetch('PREV_REF')
  new_ref = ENV.fetch('NEW_REF')
  resolved_new_ref = ENV.fetch('RESOLVED_NEW_REF')
  tag_name = ENV.fetch('TAG_NAME')
  repo_url = ENV.fetch('REPO_URL')

  subjects = `git log #{prev_ref}...#{resolved_new_ref} --grep='Merge pull request #[0-9]* from' --pretty=format:%s`
  prs = subjects.lines.map do |subject|
    pr_number = subject.match(/Merge pull request #([0-9]+) from/)[1]
    pr_title = `gh pr view #{pr_number} --json title -q '.title'`.strip
    { pr_number: pr_number, pr_title: pr_title }
  end
  puts ERB.new(<<~LINE).result(binding)
  Release <%= tag_name %>

  [<%= prev_ref %>...<%= new_ref %>](<%= repo_url %>/compare/<%= prev_ref %>...<%= resolved_new_ref %>)

  <% prs.each do |pr| %>
  - [#<%= pr[:pr_number] %> <%= pr[:pr_title] %>](<%= repo_url %>/pull/<%= pr[:pr_number] %>)
  <% end %>
  LINE
end

task :default => :compile

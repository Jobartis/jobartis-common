# encoding: utf-8

require 'rubygems'
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "jobartis-common"
  gem.homepage = "http://github.com/Jobartis/jobartis-common"
  gem.license = "MIT"
  gem.summary = %Q{Common things for Jobartis}
  gem.description = %Q{TODO: longer description of your gem}
  gem.email = "maciej.lotkowski@gmail.com"
  gem.authors = ["Maciej Lotkowski"]
  gem.add_development_dependency "rdoc", "~> 3.12"
  gem.add_development_dependency "bundler", "~> 1.0"
  gem.add_development_dependency "jeweler", "~> 2.0.1"
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "jobartis-common #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

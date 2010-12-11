require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "auto-hyde"
  gem.homepage = "http://github.com/gotmayonase/auto-hyde"
  gem.license = "MIT"
  gem.summary = %Q{A simple sinatra app exposing a url for github post-receive hooks to hit and trigger a rebuild of a Jekyll site.}
  gem.description = %Q{}
  gem.email = "gotmayonase@gmail.com"
  gem.authors = ["Mike Mayo"]
  gem.add_dependency 'sinatra', '>= 1.1.0'
  gem.add_dependency 'systemu', '>= 1.2.0'
  gem.add_dependency 'pony', '>= 1.1'
  gem.executables << 'auto-hyde'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "auto-hyde #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

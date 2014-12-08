require 'bundler/gem_tasks'

def name
  @name ||= Dir['*.gemspec'].first.split('.').first
end

desc "Run all test cases"
task :test do |test|
  puts "name: #{name}"
  sh "ruby -Ilib:test test/#{name}/*.rb"
end

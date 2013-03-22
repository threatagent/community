#! /usr/bin/env ruby
# ThreatAgent Phishing template example usage

# If mustache isn't installed install it.
begin
  require 'mustache'
rescue LoadError
  $stdout.puts 'Executing `gem install mustache --no-rdoc --no-ri`...'
  $stdout.puts 'Run again after mustache is installed'
  exec 'gem install mustache --no-rdoc --no-ri'
end
require 'optparse'

opts = OptionParser.new do |opt|
  opt.banner = "Usage: #{__FILE__} <mustache_template>"
  opt.separator ''
  opt.separator 'This example file uses Mustache to render'
  opt.separator 'templates with a hash of example values'
  opt.version = "0.0.1"
end

variables = { company: 'Acme Corporation',
              domain: 'acme-corp.com',
              email: 'john.doe@example.com',
              fname: 'John',
              lname: 'Doe',
              location: 'Fairfield', # New Jersey
              name: 'John Doe' }

if ARGV.empty?
  $stdout.puts opts
  exit 2
else
  @template = ARGV.first
end

# Parse the options
opts.parse!

$stdout.puts "Using example data:"
$stdout.puts "==="
$stdout.puts variables
$stdout.puts
$stdout.puts "Using template:"
$stdout.puts "==="
$stdout.puts @template
$stdout.puts

begin
  @content = File.read(@template)
rescue => e
  $stderr.puts "Couldn't access #@template"
  exit 1
end

rendered = Mustache.render(@content, variables)
$stdout.puts "Rendered template:"
$stdout.puts '==='
$stdout.puts rendered
$stdout.puts

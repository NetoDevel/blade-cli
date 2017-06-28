#!/usr/bin/env ruby
require 'optparse'
require_relative 'new_project'
require_relative 'run'

options = {}
action = ""
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"

  #string as argument
  opts.on("-n", "--new project") do |name_project|
    options[:name_project] = name_project
    action = "new"
  end

  opts.on("-t", "--type project") do |type|
    options[:type] = type
    action = "type"
  end

  opts.on("-s", "--run project") do |main_class|
    action = "run"
    options[:main_class] = main_class
  end

  opts.on("-p", "--set port server") do |port|
    action = "port"
    options[:port] = port
  end

  #Boolean as argument
  opts.on("-v", "--[no-]verbose", "Run verbosely") do |verbose|
    options[:verbose] = verbose
    puts "blade 2.0.0"
  end

  opts.on("-h", "--help", "Show this help") do |v|
    puts opts
  end

end.parse!

if (action == "new")
    new_project = NewProject.new
    new_project.init(options[:name_project], ARGV[0])
end 

if (action == "run")
    run = Run.new
    run.init(options[:main_class])
end 




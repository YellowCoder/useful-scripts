#!/usr/bin/env ruby
require 'rubygems'
require 'term/ansicolor'
include Term::ANSIColor

if ARGV[0].nil?
  print red, bold, ">> You must specify the path argument.\n"
  print white, bold, "---------------------------------------------\n"
  print white, bold, "Example: ruby list_current_branch.rb '~/path'\n"
  print white, bold, "---------------------------------------------"
  puts
else
  dev_dir = File.expand_path("#{ ARGV[0] }", __FILE__)

  def branch_name(dir)
    `cd #{ dir } && git rev-parse --abbrev-ref HEAD`.gsub("\n", '')
  end

  def has_uncommitted_files?(dir)
    `cd #{ dir } && git st`.match('nothing to commit')
  end

  Dir[ "#{ dev_dir }/*"].each do |dir|
    if Dir.exists? "#{ dir }/.git"
      branch = branch_name(dir)
      branch += '*' unless has_commit?(dir)
      print green, bold, ">> #{ File.basename(dir).ljust(40) }", branch
      puts
    end
  end
end
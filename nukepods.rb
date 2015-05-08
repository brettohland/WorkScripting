#! /usr/bin/env ruby
 
require 'fileutils'
require 'pathname'

root = %x(git rev-parse --show-toplevel).chomp #Remove the \n character at the end of the path returned
root_path = Pathname.new(root)

abort("No git directory, aborting") unless root_path.exist?

podfile = root + '/Podfile.lock'
pods = root + '/Pods'

podfile_path = Pathname.new(podfile)
pods_path = Pathname.new(pods)
 
abort("This project isn't using Cocoapods, aborting") unless podfile_path.exist? and pods_path.exist?

puts("I say we take off and nuke the entire site from orbit. It's the only way to be sure.")

podfile_path.delete() if podfile_path.exist?
pods_path.rmtree if pods_path.exist?

puts('Deleted Podfile.lock and /pods. Running `pod install`')
 
system 'pod install' unless podfile_path.exist? and pods_path.exist?

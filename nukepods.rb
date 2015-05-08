#! /usr/bin/env ruby
 
require 'fileutils'
require 'pathname'

#Remove the \n character at the end of the path returned
root = %x(git rev-parse --show-toplevel).chomp 
root_path = Pathname.new(root)

podfile = root + '/Podfile.lock'
pods = root + '/Pods'

podfile_path = Pathname.new(podfile)
pods_path = Pathname.new(pods)
 
podfile_path.delete() if podfile_path.exist?
pods_path.rmtree if pods_path.exist?
 
system 'pod install' unless podfile_path.exist? and pods_path.exist?
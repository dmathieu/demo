require "rubygems"
require "bundler/setup"
$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/lib')
require 'myapp'

run Myapp

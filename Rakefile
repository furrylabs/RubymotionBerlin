# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'bundler'

if ARGV.join(' ') =~ /spec/
  Bundler.require :default, :spec
else
  Bundler.require
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'RubymotionBerlin'
  app.files = (app.files - Dir.glob('./app/**/*.rb')) + Dir.glob("./lib/**/*.rb") + Dir.glob("./config/**/*.rb") + Dir.glob("./app/**/*.rb")
  
  app.vendor_project('vendor/Reachability', :static)
  
  app.pods do
    pod 'SVProgressHUD', '0.8'
    pod 'NUI'
  end
end

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
  app.files = (app.files - Dir.glob('./app/**/*.rb')) + Dir.glob("./lib/**/*.rb") + Dir.glob("./app/**/*.rb")
  
  app.libs += ['/usr/lib/libz.dylib', '/usr/lib/libsqlite3.dylib']
  app.frameworks << 'AVFoundation'
  app.frameworks << 'QuartzCore'
  app.frameworks << 'AddressBook'
  app.frameworks << 'AddressBookUI'
  app.frameworks << 'MobileCoreServices'
  app.frameworks << 'SystemConfiguration'
  app.frameworks << 'AudioToolbox'
  app.frameworks << 'CFNetwork'
  app.frameworks << 'CoreGraphics'
  app.frameworks << 'CoreLocation'
  app.frameworks << 'libsqlite3.dylib'
  app.frameworks << 'libz.1.1.3.dylib'
  app.frameworks << 'Security'
  app.frameworks << 'StoreKit'
  app.frameworks << 'MapKit'
  app.frameworks << 'MessageUI'
  app.weak_frameworks << 'Accounts'
  app.weak_frameworks << 'AdSupport'
  app.weak_frameworks << 'Social'

  app.vendor_project('vendor/Parse.framework', :static, :products => ['Parse'], :headers_dir => 'Headers')
  app.vendor_project('vendor/FacebookSDK.framework', :static, :products => ['FacebookSDK'], :headers_dir => 'Headers')
  
  app.detect_dependencies = false
  
  app.pods do
    pod 'SVProgressHUD', '0.8'
    pod 'NUI'
  end
end

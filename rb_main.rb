#
#  rb_main.rb
#  ItunesFeeder
#
#  Created by Tommy Sundström on 27/6-09.
#  Copyright (c) 2009 Helt Enkelt ab. All rights reserved.
#

require 'osx/cocoa'
include OSX

# Require the helper function that loads all Rubys project files
require(File.join(File.dirname(__FILE__), 'require_application_files.rb'))


NSLog "--- rb_main.rb ---"
NSLog "Ruby version: #{RUBY_VERSION}." # MacRuby version: #{MACRUBY_VERSION}." # Note: If this is not runned
      # with MacRuby an error will be raised here.

# Loading all Ruby project files. I've made my own version that is better suited for editing with
# other editors than Xcode.
begin
  context = __FILE__
  #context = OSX::NSBundle.mainBundle.resourcePath.fileSystemRepresentation # The resource dir of the app. (This
        # is always (?) the dir where this file (rb_main.rb) is.)
  PROJECT_ROOT = File.dirname(context)
  APP_ROOT = File.join(PROJECT_ROOT, 'app')
  ### Tror bast ersatta med Fenestra-koden ### Require_application_files::require_third_party_gems_and_lib(PROJECT_ROOT)
  Require_application_files::add_to_load_path(APP_ROOT)
  Require_application_files::require_standardutilities
  Require_application_files::require_all(APP_ROOT)
end


def rb_main_init
 
  # Require and load files
  context = __FILE__
  #context = OSX::NSBundle.mainBundle.resourcePath.fileSystemRepresentation # The resource dir of the app. (This
        # is always (?) the dir where this file (rb_main.rb) is.)
  app_root = File.join(File.dirname(context), 'app')
  Require_application_files::add_to_load_path(app_root)
  Require_application_files::require_standardutilities
  Require_application_files::require_all(app_root)
end

if $0 == __FILE__ then
  OSX::NSLog '---------- rb_main.rb started ----------'
  rb_main_init
  OSX.NSApplicationMain(0, nil)
end

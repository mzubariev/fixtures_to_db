require 'capybara/cucumber'
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')

require 'models/post'
require 'models/user'
require 'parser/parser'
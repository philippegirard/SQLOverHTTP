ENV['RACK_ENV'] = 'test'

require 'rack/test'
require 'test/unit'

class TestHelper < Test::Unit::TestCase
  include Rack::Test::Methods
end
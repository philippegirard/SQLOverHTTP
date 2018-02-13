ENV['RACK_ENV'] = 'test'

require 'rack/test'
require 'test/unit'
require 'SQLOHTTP'

class SQLOHTTPTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    SQLOHTTP
  end

  def test_returns_200_when_using_post
    post "/"
    assert_equal 200, last_response.status
  end

  def test_retures_SQL_missing_when_no_JSON_body_specified
    post "/"
    assert_equal "SQL request missing", last_response.body
  end
end


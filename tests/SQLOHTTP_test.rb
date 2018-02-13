require 'test_helper'
require 'SQLOHTTP'

class SQLOHTTPTest < TestHelper
  def app
    SQLOHTTP
  end

  test "returns 200 when using post" do
    post "/"
    assert_equal 200, last_response.status
  end

  test "returns SQL missing when not JSON body is specified" do
    post "/"
    assert_equal "SQL request missing", last_response.body
  end

  test "returns query result when JSON body is specified" do
    post "/", {query: 'SELECT * FROM users'}.to_json, {format: 'json'}
    assert_equal 200, last_response.status
    assert_equal "[[\"1\", \"klasjdfklakldfsja\", \"phil\", \"fj34w90j2\"]]", last_response.body
  end
end

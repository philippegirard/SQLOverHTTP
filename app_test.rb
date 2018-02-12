require "rack/test"
require "app"

RSpec.configure do |config|
  config.include Rack::Test::Methods
end


describe SQLOHTTP do
  def app
    SQLOHTTP # this defines the active application for this test
  end

  it "works when using post" do
    post "/"
    expect(last_response.status).to eq 200
  end

  it "returns SQL missing when no JSON body is specified" do
    post "/"
    expect(last_response.body).to eq "SQL request missing"
  end
end
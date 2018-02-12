require 'sinatra'
require './database'
require 'json'

class SQLOHTTP < Sinatra::Base
  set :raise_errors, true
  set :dump_errors, false
  set :show_exceptions, false

  def initialize
    super
    @db = Database.new
  end

  post '/' do
    return 'SQL request missing' unless request.body.size > 0
    payload = JSON.parse(request.body.read)
    res = @db.query(payload['query'])
    res.values.to_s
  end
end

SQLOHTTP.run!
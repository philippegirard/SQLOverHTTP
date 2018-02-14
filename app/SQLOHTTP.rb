require 'activesupport_dep'
require 'json'
require 'sinatra'
require 'database'

class SQLOHTTP < Sinatra::Base
  set :raise_errors, true
  set :dump_errors, false
  set :show_exceptions, false

  def initialize
    super
    @db = Database.new
  end

  get '/' do
    'HELLO WORLD'
  end

  post '/' do
    return 'SQL request missing' unless request.body.size > 0
    res = @db.query(params[:query])
    res.values.to_s
  end

  private

  def params
    JSON.parse(request.body.read).with_indifferent_access
  end
end
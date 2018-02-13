require 'pg'

class Database
  attr_reader :pg_connection
  attr_reader :pg_config

  def initialize(user_config = {})
    @pg_config = {
      dbname: 'project',
      user: 'postgres'
    }.merge!(user_config)
    
    @pg_connection = PG.connect(pg_config)
  end

  def query(query_str)
    pg_connection.exec(query_str)
  end
end
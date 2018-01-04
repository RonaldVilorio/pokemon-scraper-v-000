require 'pry'
class Pokemon
  attr_accessor :id,:name,:type,:db
  @database_connection = SQLite3::Database.new('db/pokemon.db')


  def initialize(attributes)
    attributes.each{|key,value| self.send("#{key}=",value)}
  end

  def self.save(name,type,db)
    @database_connection.execute("INSERT INTO pokemon (name,type,db) VALUES (?, ?, ?)",name,type,db)

  end

end

require 'pry'
class Pokemon
  attr_accessor :id,:name,:type,:db

  def initialize(id=nil,name=nil,type=nil,db=nil)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name,type,db)
    db.execute("INSERT INTO pokemon (name,type) VALUES (?, ?)",name,type)
  end
  def self.find(id,db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = (?)",id)
    pokemon = pokemon.flatten
    Pokemon.new(pokemon[0],pokemon[1],pokemon[2])
  end
  


end

require 'pry'
class Pokemon
  attr_accessor :id,:name,:type,:db,:hp

  def initialize(id=nil,name=nil,type=nil,hp=nil,db=nil)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db

  end

  def self.save(name,type,db,hp=nil)
    db.execute("INSERT INTO pokemon (name,type,hp) VALUES (?, ?, ?)",name,type,hp)
  end
  def self.find(id,db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = (?)",id)
    pokemon = pokemon.flatten
    Pokemon.new(pokemon[0],pokemon[1],pokemon[2],pokemon[3])
    # binding.pry

  end



end

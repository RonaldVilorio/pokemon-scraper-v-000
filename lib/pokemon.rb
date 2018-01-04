require 'pry'
class Pokemon
  attr_accessor :id,:name,:type,:db

  def initialize(id=nil,name=nil,type=nil,db=nil,hp=nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name,type,db,hp=nil)
    db.execute("INSERT INTO pokemon (name,type,hp) VALUES (?, ?, ?)",name,type,hp)
  end
  def self.find(id,db)
    binding.pry
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = (?)",id)
    pokemon = pokemon.flatten
    Pokemon.new(pokemon[0],pokemon[1],pokemon[2],pokemon[3])

  end



end

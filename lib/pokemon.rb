require 'pry'
class Pokemon
  attr_accessor :id,:name,:type,:db

  def initialize(attributes)
    attributes.each{|key,value| self.send("#{key}=",value)}
  end

  def self.save(name,type,db)
    db.execute("INSERT INTO pokemon (name,type) VALUES (?, ?)",name,type)
  end
  def self.find(id,db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = (?)",id)
    pokemon = pokemon.flatten
    pokemon[]
    binding.pry
    Pokemon.new(pokemon)

  end


end

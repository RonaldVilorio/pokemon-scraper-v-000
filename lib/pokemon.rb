require 'pry'
class Pokemon
  attr_accessor :id,:name,:type,:db

  def initialize(attributes)
    attributes.each{|key,value| self.send("#{key}=",value)}
  end

  def self.save(name,type,db)
    db.execute("INSERT INTO pokemon (name,type) VALUES (?, ?)",name,type)
  end
  def self.find(db)
    

  end


end

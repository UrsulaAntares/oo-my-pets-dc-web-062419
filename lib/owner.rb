class Owner
  
  attr_reader :species, :name 
  attr_accessor :cats, :dogs
  def initialize(name)
    @name = name
    @pets = []
    self.class.all << self
    @species = "human"
    # @cats = []
    # @dogs = []
  end

  @@all = []
  
  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
  end

  def say_species
    "I am a #{@species}." 
  end

  def cats
    # binding.pry
    Cat.all.select {|cat| cat.owner == self } 
  end

def dogs
  #binding.pry
  Dog.all.select {|dog| dog.owner == self}
  
end

#binding.pry
def walk_dogs 
  self.dogs.each {|dog| dog.mood = "happy"}
end
def feed_cats
self.cats.each {|cat| cat.mood = "happy"}
end

def sell_pets 
  self.cats.each {|cat| cat.mood = "nervous"}
  self.dogs.each {|dog| dog.mood = "nervous"}
  self.cats.each {|cat| cat.owner = nil}
  self.dogs.each {|dog| dog.owner = nil}
end

def list_pets
  return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  
end


end
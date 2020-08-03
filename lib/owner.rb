require 'pry'

class Owner
  # or I can do create a getter method
  #   def name
  #     @name
  #   end
  @@all=[]
  attr_reader :name, :species
  def initialize (name)
    @name=name
    @species="human"
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.count
    @@all.count
  end
  
  def self.reset_all
    @@all.clear
  end
  
  def say_species
  "I am a #{@species}."
  end
  def cats
    Cat.all.select {|cat| cat.owner==self}
  end
  def dogs
    Dog.all.select {|dog| dog.owner==self}
  end
  def buy_cat (cat)
    Cat.new(cat, self)
  end
  def buy_dog(dog)
    Dog.new(dog,self)
  end
  def walk_dogs
    self.dogs.each {|dog| dog.mood="happy"}
   # binding.pry
  end
  def feed_cats
    self.cats.each {|cat| cat.mood="happy"}
  end
  def sell_pets
  pets=self.dogs+self.cats
  pets.each do |pet| 
    pet.mood="nervous"
    pet.owner=nil
  end
end
def list_pets
  num_of_cats=self.cats.count
  num_of_dogs=self.dogs.count
  "I have #{num_of_dogs} dog(s), and #{num_of_cats} cat(s)."
end







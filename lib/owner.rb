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
    binding.pry
  end
end







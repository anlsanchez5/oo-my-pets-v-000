
require 'pry'
class Owner
  # code goes here

  attr_accessor :pets, :name
  attr_reader :species
  @@all = []

  def initialize(species, name = nil)
    @species = species
    @name = nil
    @pets = {:fishes => [], :dogs => [], :cats => []}
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

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end

  def walk_dogs
    @pets[:dogs].collect {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].collect {|cat| cat.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].collect {|fish| fish.mood = "happy"}
  end

  def sell_pets
    @pets.collect do |species, pet_array|
      pet_array.collect {|pet| pet.mood = "nervous"}
    end

    @pets.clear
  end

  def list_pets
   fish = @pets[:fishes].size
   cats = @pets[:cats].size
   dogs = @pets[:dogs].size
   return "I have #{fish} fish, #{dogs} dog(s), #{cats} cat(s)."
  end
end

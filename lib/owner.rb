class Owner
  attr_accessor :name, :pets
  attr_reader :species

  @@all = []

  def initialize(species)
    @@all << self
    @species = species
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(fish)
    fish = Fish.new(fish)
    @pets[:fishes] << fish #fish is being shoveled into array
  end

  def buy_cat(cat)
    cat = Cat.new(cat)
    @pets[:cats] << cat #cat is being shoveled into array
  end

  def buy_dog(dog)
    dog = Dog.new(dog)
    @pets[:dogs] << dog #fish is being shoveled into array
  end

  def walk_dogs
    @pets[:dogs].select do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].select do |cat|
      cat.mood = "happy"
    end
  end

# expect(fish.mood).to eq("happy")
  def feed_fish
    @pets[:fishes].select do |fish|
      fish.mood = "happy"
    end
  end

# owner.pets.each {|type, pets| expect(pets.empty?).to eq(true) }
  def sell_pets
    @pets.select do |key, value|
      value.select do |pet|
        pet.mood = "nervous"
      end
    end
    @pets.clear
  end


# expect(owner.list_pets).to eq("I have 2 fish, 3 dog(s), and 1 cat(s).")
  def list_pets
    "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end

end

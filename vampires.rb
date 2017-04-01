class Vampire

attr_reader :name, :age, :in_coffin, :drank_blood_today

  @@coven = []

  def initialize(name)
    @name = name
    @age = 1
    @in_coffin = true
    @drank_blood_today = false
  end

  def self.create(vampire)
    vampire = Vampire.new(vampire)
    @@coven << vampire
  end

  def drink_blood
    @drank_blood_today = true
  end

  def go_home
    @in_coffin = true
  end

  def self.all
    @@coven
  end

  #sunset sets drank blood today and in coffin to false for the entire coven as they go out in search of blood
  def self.sunset
    @@coven.each do |vampire|
      @in_coffin = false
      @drank_blood_today = false
    end
      puts "Night falls..."
  end

  def self.hunt
    @@coven.each do |vampire|
      if rand(3) == 1 #(0, 1, or 2: 33% chance they'll feed)
        vampire.drink_blood
        puts "#{vampire.name} drank blood"
        vampire.go_home
      end
    end
  end

  #sunrise removed from the coven any vampires who are out of their coffins or who havent drank any blood
  def self.sunrise
    @@coven.delete_if do |vampire|
      if vampire.die?
        puts "#{vampire.name} did not make it"
      end
      vampire.die?
    end
  end

  def die?
    !@drank_blood_today || !@in_coffin
  end





end

Vampire.create("Jacob")
Vampire.create("Harry")
Vampire.create("George")
Vampire.create("Richard")
Vampire.create("Carl")
Vampire.create("Daryl")
puts Vampire.hunt
puts Vampire.sunrise
puts Vampire.sunset
puts Vampire.hunt
puts Vampire.sunrise
puts Vampire.sunset

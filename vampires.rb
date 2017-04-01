class Vampire

  @@coven = []

  def initialize(name)
    @name = name
    @age = 0
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

  def self.sunset
    @@coven.each do |vampire|
      @in_coffin = false
      @drank_blood_today = false
    end
  end

  def self.hunt
    @@coven.each do |vampire|
      if rand(3) == 1 #(0, 1, or 2: 33% chance they'll feed)
        vampire.drink_blood
      end
    end
  end



  #sunrise removed from the coven any vampires who are out of their coffins or who havent drank any blood



  #sunset sets drank blood today and in coffin to false for the entire coven as they go out in search of blood




end

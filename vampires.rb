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

  #sunrise removed from the coven any vampires who are out of their coffins or who havent drank any blood



  #sunset sets drank blood today and in coffin to false for the entire coven as they go out in search of blood




end

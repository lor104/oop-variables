class Vampire

  @@coven = []

  def initialize(name)
    @name = name
    @age = 0
    @in_coffin = true
    @drank_blood_today = nil
  end

  def self.create(vampire)
    vampire = Vampire.new(vampire)
    @@coven << vampire
  end


end

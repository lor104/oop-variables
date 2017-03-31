class Zombie

  @@horde= [] #should start as an empty array and will eventually contain the collection of all zombies.
  @@plague_level = 10 #used to determine the rate at which new zombies are spawned. This value will increase over time.
  @@max_speed = 5 #indicates the maximum value for the speed attribute of any zombie. This value won't change.
  @@max_strength = 8 #indicates the maximum value for the strength attribute of any zombie. This value won't change.
  @@default_speed = 1 #This value won't change.
  @@default_strength = 3 #This value won't change.

  def initialize(speed, strength)
    if speed > @@max_speed
      @speed = @@default_speed
    else
      @speed = speed
    end
    if strength > @@max_strength
      @strength = @@default_strength
    else
      @strength = strength
    end

    @@horde << self
  end

  def self.all
    @@horde
  end

  def self.spawn
    @@plague_level.times do # |num|
      speed = rand(@@max_speed + 1)
      strength = rand(@@max_strength + 1)
      # puts "Zom #{num}: Speed: #{speed}, Strength: #{strength}"
      Zombie.new(speed, strength)
    end
    return @@horde
  end

  def self.increase_plague_level
    @@plague_level += rand(3)
  end


end

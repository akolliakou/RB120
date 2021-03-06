module Pushable
  def can_push?(kgs)
    kgs < 1500 ? yes : no
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :year, :model

  @@number_of_vehicles = 0

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @@number_of_vehicles +=1
  end

  def speed_up(number)
    @speed += number
    puts "Step on the gas and increase speed by #{number} kmph."
  end

  def brake(number)
    @speed -= number
    puts "Step on the brake and decrease speed by #{number} kmph."
  end

  def current_speed
    puts "You are going at #{@speed} kmph."
  end
  
  def shut_down
    @speed = 0
    puts "You are now stopped"
  end

  def spray_paint(color)
    self.color = color
    puts "The new #{color} paint looks good!"
  end

  def self.mileage(gallons, kmhs)
    puts "This car covers #{kmhs / gallons} kmhs per gallon of gas."
  end

  def self.count_vehicles
    @@number_of_vehicles
  end

  def age
    "The vehicle is #{years_old} years old."
  end

  private 

  def years_old
    Time.now.year - self.year
  end
end

class MyCar < Vehicle
  include Pushable

  DOORS = 5

  def to_s
    "My car is a #{@model} model."
  end
end

class MyTruck < Vehicle
  DOORS = 3
  def to_s
    "My truck is a #{@model} model."
  end
end

toyota = MyCar.new(2005, 'silver', 'corolla')
toyota.speed_up(10)
toyota.current_speed
toyota.brake(10)
toyota.current_speed
toyota.shut_down
toyota.current_speed
toyota.color = 'red'
puts toyota.color
puts toyota.year
toyota.spray_paint('black')
puts toyota.color
MyCar.mileage(15, 250)
puts toyota
puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors
puts toyota.age

class Vehicle
  attr_accessor :color
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed_up(number)
    @speed += number
    puts "Step on the gas and increase speed by #{number} kmph"
  end

  def brake(number)
    @speed -= number
    puts "Step on the brake and decrease speed by #{number} kmph"
  end

  def current_speed
    puts "You are going at #{@speed} kmph"
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
end

class MyCar < Vehicle
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

my_car = MyCar.new('2015', 'toyota', 'silver')
class MyCar
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
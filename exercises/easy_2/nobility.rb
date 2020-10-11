module Walkable
  def walk
    puts "#{full_name} #{gait} forward"
  end
end

class Animal
  include Walkable 

  def initialize(name)
    @name = name
  end

  def full_name
    @name
  end
end

class Person < Animal
  private

  def gait
    "strolls"
  end
end

class Cat < Animal
  private

  def gait
    "saunters"
  end
end

class Cheetah < Animal
  private

  def gait
    "runs"
  end
end

class Noble < Animal
  attr_reader :title, :name

  def initialize(name, title)
    super(name)
    @title = title
  end

  def full_name
    "#{title} #{name}"
  end

  private

  def gait
    "struts"
  end
end

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"

byron = Noble.new("Byron", "Lord")
byron.walk
# => "Lord Byron struts forward"
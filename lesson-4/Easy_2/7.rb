#If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# The `@@cats_count` variable is a class variable initialised to `0`. Every time
# a new `Cat` object is instantiated, the `initialize` method is triggered
# which causes `@@cats_count` variable to be incremented by `1`. Then inside 
# the class method `cats_count` we access the value of the `@@cats_count` 
# class variable.

kitty = Cat.new("tubby")
Cat.cats_count # >> 1
lucy = Cat.new("siamese")
Cat.cats_count # >> 2
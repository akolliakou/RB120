#If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

#You can see in the make_one_year_older method we have used self. 
#What does self refer to here?

# Since self if used inside instance method `make_one_year_older` it
# will refer to the instance that called the method - the calling object.
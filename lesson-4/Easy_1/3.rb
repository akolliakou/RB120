# When we called the go_fast method from an instance of the Car class 
# you might have noticed that the string printed when we go fast 
# includes the name of the type of vehicle we are using. How is this done?

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

car = Car.new
car.go_fast # >> I am a Car and going super fast!

# `self` prepended in the `class` method invocation refers to the object 
# itself either a `Car` or a `Truck`. The return value of this method invocation
# is the class the object was instantiated from. The return value is interpolated
# meaning that`to_s` is called automatically and we don't need to call it again.
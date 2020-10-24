#If we have this code:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

#What happens in each of the following cases:

hello = Hello.new
hello.hi # >> "Hello"

hello = Hello.new
hello.bye # undefined method

hello = Hello.new
hello.greet # arguments given 0 expected 1

hello = Hello.new
hello.greet("Goodbye") # "Goodbye"

Hello.hi # undefined method

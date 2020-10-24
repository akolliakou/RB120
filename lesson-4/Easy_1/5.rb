# Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# The `Pizza` class has an instance variable because it's the only class
# inside of which a variable is initialised with symbol `@`.

apple = Fruit.new("apple")
margarita = Pizza.new("margarita")

apple.instance_variables
margarita.instance_variables
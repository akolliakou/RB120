class Pet
  attr_accessor :name
  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 42
fluffy = Pet.new(name)
name += 1 # => 43
puts fluffy.name # => 42
puts fluffy # => My name is 42.
puts fluffy.name # => 42
puts name # => 43
fluffy.name = name += 2 # references the external variable value `43`
puts name #
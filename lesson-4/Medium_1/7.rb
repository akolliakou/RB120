# How could you change the method name 
# below so that the method name is more clear and less repetitive?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.light_status
    "I have a brightness level of #{brightness} and a color of #{color}"
  end

end

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.status
    "I have a brightness level of #{brightness} and a color of #{color}"
  end

end

# So when we call the class method `status`, we avoid the use of the word
# light twice. `Light.status` rather than `Light.light_status`.
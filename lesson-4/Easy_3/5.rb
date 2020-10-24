#If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

#What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer # undefined method
tv.model # method logic of `model` method

Television.manufacturer # method logic of `manufacturer` method
Television.model # undefined method
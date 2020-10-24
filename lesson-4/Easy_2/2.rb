#We have an Oracle class 
#and a RoadTrip class that inherits from the Oracle class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

# What is the result of the following:

trip = RoadTrip.new
p trip.predict_the_future

# "You will " + "visit Vegas" or "fly to Fiji" or "romp in Rome"
# Since we are calling `predict_the_future` on an instance of the `RoadTrip` method
# Ruby will first look for the method in the class on whose object the method
# is being called. It will only look in `Oracle` if it doesn't find it in the 
# subclass

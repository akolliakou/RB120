#If we have this class:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

#What would happen if we added a play method to the Bingo class, 
#keeping in mind that there is already a method of this name 
#in the Game class that the Bingo class inherits from.

# When we call `play` on instances of the `Bingo` class, Ruby will execute
# the `play` method inside `Bingo` rather than `Game` according to method lookup
# rules. It will check for the method inside the object's class first. If
# it finds it, it will invoke it and stop traversing the path, otherwise it
# will move up the lookup chain.
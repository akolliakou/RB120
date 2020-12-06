class Move
  OPTIONS = {
    'r' => 'rock',
    'l' => 'lizard',
    'sp' => 'spock',
    'sc' => 'scissors',
    'p' => 'paper'
  }

  WINNING_OPTIONS = {
    'r' => ['s', 'l'],
    'l' => ['p', 'sp'],
    'sp' => ['r', 's'],
    's' => ['p', 'l'],
    'p' => ['r', 'sp']
  }

  def initialize(value)
    @value = value
  end

  def to_s
    OPTIONS[value]
  end

  def >(other_move)
    WINNING_OPTIONS[value].include?(other_move.value)
  end

  protected

  attr_reader :value
end

class Player
  attr_accessor :name, :move, :moves, :score

  def initialize
    @moves = []
    @score = 0
    set_name
  end
end

class Human < Player
  def choose
    choice = ''
    loop do
      ask_for_choice
      choice = gets.chomp
      break if Move::VALUES.keys.include? choice
      prompt("Sorry, that was not a valid choice. Try again!")
    end

    self.move = Move.new(choice)
    moves << move.to_s
  end

  private

  def set_name
    system 'clear'
    n = nil
    loop do
      puts "What is your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, that is not a valid name. Try again!"
    end
    self.name = n
  end

  def ask_for_choice
    prompt("Choose one:
    'r'  for rock,
    'p'  for paper,
    's' for scissors,
    'l'  for lizard,
    'sp' for spock")
  end

end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end
end

class R2D2 < Computer
  def set_name
    self.name = 'R2D2'
  end

  def choose
    self.move = Move.new('r')
    moves << move
  end
end

class Hal < Computer
  def set_name
    self.name = 'Hal'
  end

  def choose
    self.move = Move.new(['r', 's', 's', 's', 's', 'l', 'l'].sample)
    moves << move
  end
end

class Chappie < Computer
  def set_name
    self.name = 'Chappie'
  end

  def choose
    self.move = Move.new(['r', 'sp', 's', 'p' 'l', 'l', 'l', 'l', 'l'].sample)
    moves << move
  end
end

class Sonny < Computer
  def set_name
    self.name = 'Sonny'
  end

  def choose
    self.move = Move.new('p')
    moves << move
  end
end

class Number5 < Computer
  def set_name
    self.name = 'Number 5'
  end

  def choose
    self.move = Move.new(Move::OPTIONS.keys.sample)
    moves << move
  end
end


class RPSGame
  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
  puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!
  Whoever gets to 5 wins first, wins the game! 
  Enter your name:"
  end

  def display_goodbye_message
    puts "Thank you for playing! Goodbye : )"
  end

  def play
    system 'clear'
    display_welcome_message
    display_rules
    human.choose
    computer.choose
    display_moves
    compare_moves
    update_score
    display_score
    play_another_match || display_winner
    clear_screen
    play_again
  end
end

def compare(move1, move2)
end

RPSGame.new.play
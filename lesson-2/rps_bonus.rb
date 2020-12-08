require 'yaml'
MESSAGES = YAML.load_file('rps.yml')

class Move
  OPTIONS = {
    'r' => 'rock',
    'p' => 'paper',
    's' => 'scissors',
    'l' => 'lizard',
    'sp' => 'spock'
  }

  WINNING_OPTIONS = {
    'r' => ['s', 'l'],
    'p' => ['r', 'sp'],
    's' => ['p', 'l'],
    'l' => ['p', 'sp'],
    'sp' => ['r', 's']
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
      choice = gets.chomp.downcase
      break if Move::OPTIONS.keys.include?(choice)
      puts "Sorry, that was not a valid choice. Try again!"
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
      break unless invalid_name?(n)
      puts "Sorry, that is not a valid name. Try again!"
    end
    self.name = n
  end

  def invalid_name?(name)
    name.empty? || name.chars.all? { |char| char == ' ' }
  end

  def ask_for_choice
    puts ""
    puts "Choose one:
    'r'  for rock,
    'p'  for paper,
    's' for scissors,
    'l'  for lizard,
    'sp' for spock"
  end
end

class Computer < Player
  def initialize
    @computers = [R2D2, Hal, Chappie, Sonny, Number5].sample.new
    super
  end

  def choose
    self.move = computers.choose
    moves << move.to_s
  end

  private

  attr_reader :computers

  def set_name
    self.name = computers.name
  end
end

class R2D2 < Computer
  def initialize; end

  def choose
    Move.new('r')
  end

  def name
    self.class.to_s
  end
end

class Hal < Computer
  def initialize; end

  def choose
    Move.new(['r', 's', 's', 's', 's', 'l', 'l', 'sp', 'sp'].sample)
  end

  def name
    self.class.to_s
  end
end

class Chappie < Computer
  def initialize; end

  def choose
    Move.new(['r', 'sp', 's', 'p', 'l', 'l', 'l', 'l', 'l'].sample)
  end

  def name
    self.class.to_s
  end
end

class Sonny < Computer
  def initialize; end

  def choose
    Move.new('p')
  end

  def name
    self.class.to_s
  end
end

class Number5 < Computer
  def initialize; end

  def choose
    Move.new(Move::OPTIONS.keys.sample)
  end

  def name
    self.class.to_s
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    display_welcome_message
    display_rules

    loop do
      reset_game
      play_round
      game_display
      break unless play_another_round?
      clear_screen
    end

    display_goodbye_message
  end

  private

  WINS = 3

  def display_welcome_message
    system 'clear'
    puts "Hi #{human.name}! Welcome to Rock, Paper, Scissors, Lizard, Spock!"
    puts ""
    puts "For this game, you will be playing against #{computer.name}."
    puts "First one of you to win #{WINS} rounds wins the game!"
    puts ""
  end

  def reset_game
    reset_score
    reset_moves
  end

  def display_rules
    puts "    ----RULES----
    Rock crushes Lizard and crushes Scissors.
    Paper covers Rock and disproves Spock.
    Scissors cut Paper and decapitates Lizard.
    Spock smashes Scissors and vaporizes Rock.
    Lizard poisons Spock and eats Paper.
    You must win #{WINS} matches to win the entire game."
    puts ""
  end

  def display_score
    puts "    ----Game score----
    You have won #{human.score} rounds.
    #{computer.name} has won #{computer.score} rounds."
  end

  def players_choice
    human.choose
    computer.choose
  end

  def round_display
    display_score
    players_choice
    display_moves
    display_round_winner
  end

  def game_display
    display_score
    display_game_winner
    display_move_history
  end

  def display_moves
    puts ""
    puts "You chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def pause_screen
    sleep(1.5)
    clear_screen
  end

  def clear_screen
    system 'clear'
  end

  def update_scores
    if human.move > computer.move
      human.score += 1
    elsif computer.move > human.move
      computer.score += 1
    end
  end

  def display_round_winner
    puts ""
    if human.move > computer.move
      puts "You won this round!"
    elsif computer.move > human.move
      puts "#{computer.name} won this round!"
    else
      puts "It's a tie!"
    end

    update_scores
  end

  def play_another_round?
    answer = ''
    loop do
      puts "Would you like to play another round (y/n)?"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, please enter either 'y' or 'n'"
    end

    answer.downcase == 'y'
  end

  def game_over?
    human.score == WINS || computer.score == WINS
  end

  def display_game_winner
    puts ""
    if human.score > computer.score
      puts "You won this game!"
    else
      puts "#{computer.name} won this game!"
    end
    puts ""
  end

  def reset_score
    human.score = 0
    computer.score = 0
  end

  def reset_moves
    human.moves = []
    computer.moves = []
  end

  def display_move_history
    puts "    ---Game Summary---"

    computer.moves.size.times do |idx|
      puts "    Round #{idx + 1}:
      You chose #{human.moves[idx]}
      #{computer.name} chose #{computer.moves[idx]}"
      puts ""
    end
  end

  def show_rules?
    puts ""
    answer = ''
    loop do
      puts "Would you like to continue seeing the rules for this round?"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, please enter either 'y' or 'n'"
    end

    answer.downcase == 'y'
  end

  def display_goodbye_message
    puts "Thank you for playing! Come back soon :)"
  end

  def round_with_rules
    loop do
      clear_screen
      display_rules
      round_display
      pause_screen
      break if game_over?
    end
  end

  def play_round
    if show_rules?
      round_with_rules
    else
      loop do
        clear_screen
        round_display
        pause_screen
        break if game_over?
      end
    end
  end
end

  # or

  # def round_with_rules
  #   loop do
  #     clear_screen
  #     display_rules
  #     round_display
  #     pause_screen
  #     break if game_over?
  #   end
  # end

  # def round_without_rules
  #   loop do
  #     clear_screen
  #     round_display
  #     pause_screen
  #     break if game_over?
  #   end
  # end

  # def play_round
  #   show_rules? ? round_with_rules : round_without_rules
  # end

RPSGame.new.play

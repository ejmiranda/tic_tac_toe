# frozen_string_literal: true

# The classic paper and pencil game
class TicTacToe # rubocop:disable Metrics/ClassLength
  attr_accessor :player1, :player2, :current_player, :positions

  def initialize
    @player1 = { name: '', score: 0, symbol: '' }
    @player2 = { name: '', score: 0, symbol: '' }
    @current_player = player1
  end

  def start
    set_game
    loop do
      set_round
      until winner?
        print_board
        play_turn
      end
      end_game
      break unless play_again?
    end
  end

  private

  # Game Flow Methods

  def set_game
    print_welcome('Tic Tac Toe')
    select_players
    print_separator
  end

  def select_players
    puts 'Enter the name for Player 1'
    # player1[:name] = gets.chomp
    player1[:name] = 'Edgar'
    puts player1[:name]
    puts
    puts 'Enter the name for Player 2'
    # player2[:name] = gets.chomp
    player2[:name] = 'Lucas'
    puts player2[:name]
  end

  def set_round
    self.positions = *(1..9)
    select_symbol
  end

  def select_symbol
    current_player[:symbol] = get_valid_input(
      "#{current_player[:name]}, X or 0?",
      %w[X 0],
      "Sorry, that\'s not valid. Please try again.\n",
      true
    )
    other_player[:symbol] = current_player[:symbol] == 'X' ? '0' : 'X'
    print_separator
  end

  def winner?
    # Calculate if current player is the winner
    false
  end

  def play_turn
    puts "Pick a position #{current_player[:name]}"
    pos = gets.chomp.to_i
    # Add input (pos) validation loop
    if valid_position?(pos)
      positions[pos - 1] = current_player[:symbol]
    else
      puts 'Sorry, that one is not valid.' # Needs to loop
      puts
    end
    self.current_player = other_player
  end

  def end_game
    update_score
    print_board
    puts "The winner is #{winner[:name]}!"
    puts
  end

  def update_score
    winner[:score] += 1
  end

  def play_again?
    puts 'Do you want to play again?'
    play_again = gets.chomp
    # Add input (play_again) validation loop
    case play_again
    when 'y'
      true
    else
      false
    end
  end

  # Helper Methods

  def other_player
    current_player == player1 ? player2 : player1
  end

  def valid_position?(_pos)
    true
  end

  def get_valid_input(prompt, valid_values, invalid_msg, up_case)
    puts prompt
    loop do
      value = up_case ? gets.chomp.upcase : gets.chomp
      return value if valid_values.include?(value)

      puts invalid_msg
    end
  end

  # Printer Methods

  def print_welcome(title)
    puts
    puts '----------------------'
    puts "WELCOME TO #{title.upcase}"
    puts '----------------------'
    puts
  end

  def print_score # rubocop:disable Metrics/AbcSize
    puts "#{current_player == player1 ? '>' : ' '} #{player1[:name]} (#{player1[:symbol]}): #{player1[:score]}"
    puts "#{current_player == player2 ? '>' : ' '} #{player2[:name]} (#{player2[:symbol]}): #{player2[:score]}"
  end

  def print_board # rubocop:disable Metrics/AbcSize
    print_score
    puts
    puts "#{positions[0]} | #{positions[1]} | #{positions[2]}"
    puts '--+---+---'
    puts "#{positions[3]} | #{positions[4]} | #{positions[5]}"
    puts '--+---+---'
    puts "#{positions[6]} | #{positions[7]} | #{positions[8]}"
    puts
  end

  def print_separator
    puts
    puts '----------------------'
    puts
  end
end

game = TicTacToe.new
game.start

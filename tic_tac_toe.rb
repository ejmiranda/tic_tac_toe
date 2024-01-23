# frozen_string_literal: true

require_relative 'game'

# The classic paper and pencil game
class TicTacToe < Game
  attr_reader :player1, :player2

  def initialize
    @player1 = super.Player.new
    @player2 = super.Player.new
  end

  def start
    select_players
  end

  private

  def select_players
    puts 'Enter the name for Player 1'
    # player1.name = gets.chomp
    player1.name = 'Edgar'
    puts player1.name
    puts
    puts 'Enter the name for Player 2'
    # player2.name = gets.chomp
    player2.name = 'Lucas'
    puts player2.name
    puts
  end
end

# class TicTacToe
#   attr_accessor :player1, :player2, :current_player, :winner, :positions

#   def initialize
#     @player1 = { name: '', score: 0, symbol: '' }
#     @player2 = { name: '', score: 0, symbol: '' }
#     @current_player = player1
#   end

#   def start
#     set_game
#     loop do
#       set_round
#       loop do
#         print_board
#         play_turn
#         break if winner? || valid_positions.empty?

#         swap_current_player
#       end
#       end_game
#       break unless play_again?
#     end
#     print_banner('Thank you for playing!')
#   end

#   private

#   # Game Flow Methods

#   def set_game
#     print_banner('Welcome to Tic Tac Toe')
#     select_players
#     print_separator
#   end

#   def select_players
#     puts 'Enter the name for Player 1'
#     # player1[:name] = gets.chomp
#     player1[:name] = 'Edgar'
#     puts player1[:name]
#     puts
#     puts 'Enter the name for Player 2'
#     # player2[:name] = gets.chomp
#     player2[:name] = 'Lucas'
#     puts player2[:name]
#   end

#   def set_round
#     self.winner = nil
#     self.positions = *(1..9)
#     select_symbol
#   end

#   def select_symbol
#     # current_player[:symbol] = get_valid_value(
#     #   prompt: "#{current_player[:name]}, X or 0?",
#     #   valid_values: %w[X 0],
#     #   invalid_msg: "Sorry, that\'s not valid. Please try again.\n",
#     #   up_case: true
#     # )
#     # other_player[:symbol] = current_player[:symbol] == 'X' ? '0' : 'X'
#     player1[:symbol] = 'X'
#     player2[:symbol] = '0'
#     print_separator
#   end

#   def play_turn
#     pos = get_valid_value(
#       prompt: "Pick a position #{current_player[:name]}",
#       valid_values: valid_positions,
#       invalid_msg: 'Sorry, try again.'
#     )
#     positions[pos.to_i - 1] = current_player[:symbol]
#     print_separator
#   end

#   def valid_positions
#     positions.map do |position|
#       position.to_s if position != 'X' && position != '0'
#     end.compact
#   end

#   def winner?
#     winner_combination = Array.new(3, current_player[:symbol])
#     pos = positions
#     # [1, 2, 3, 4, 5, 6, 7, 8, 9]
#     # case 1: 1, 2, 3 <- Top Row
#     self.winner = current_player if
#     winner_combination == pos[0..2] ||
#     # case 2: 4, 5, 6 <- Mid Row
#     winner_combination == pos[3..5] ||
#     # case 3: 7, 8, 9 <- Bottom Row
#     winner_combination == pos[6..8] ||
#     # case 4: 1, 4, 7 <- Left Column
#     winner_combination == [pos[0], pos[3], pos[6]] ||
#     # case 5: 2, 5, 8 <- Mid Column
#     winner_combination == [pos[1], pos[4], pos[7]] ||
#     # case 6: 3, 6, 9 <- Right Column
#     winner_combination == [pos[2], pos[5], pos[8]] ||
#     # case 7: 1, 5, 9 <- Top Left to Bottom Right
#     winner_combination == [pos[0], pos[4], pos[8]] ||
#     # case 8: 3, 5, 7 <- Top Right to Bottom Left
#     winner_combination == [pos[2], pos[4], pos[6]]
#   end

#   def swap_current_player
#     self.current_player = other_player
#   end

#   def end_game
#     update_score unless winner.nil?
#     print_board
#     if !winner.nil?
#       puts "The winner is #{winner[:name]}!"
#     else
#       puts "It's a draw!"
#     end
#     puts
#   end

#   def update_score
#     current_player[:score] += 1
#   end

#   def play_again?
#     get_valid_value(
#       prompt: 'Do you want to play again (Y/N)?',
#       valid_values: %w[Y N],
#       invalid_msg: "Sorry, that\'s not valid. Please try again.\n",
#       up_case: true
#     ) == 'Y'
#   end

#   # Helper Methods

#   def get_valid_value(prompt:, valid_values:, invalid_msg:, up_case: false)
#     puts prompt
#     loop do
#       value = up_case ? gets.chomp.upcase : gets.chomp
#       return value if valid_values.include?(value)

#       puts invalid_msg
#     end
#   end

#   def other_player
#     current_player == player1 ? player2 : player1
#   end

#   # Printer Methods

#   def print_banner(title)
#     puts
#     puts '----------------------'
#     puts title.upcase
#     puts '----------------------'
#     puts
#   end

#   def print_separator
#     puts
#     puts '----------------------'
#     puts
#   end

#   def print_board
#     print_score
#     puts
#     puts "#{positions[0]} | #{positions[1]} | #{positions[2]}"
#     puts '--+---+---'
#     puts "#{positions[3]} | #{positions[4]} | #{positions[5]}"
#     puts '--+---+---'
#     puts "#{positions[6]} | #{positions[7]} | #{positions[8]}"
#     puts
#   end

#   def print_score
#     puts "#{current_player == player1 ? '>' : ' '} #{player1[:name]} (#{player1[:symbol]}): #{player1[:score]}"
#     puts "#{current_player == player2 ? '>' : ' '} #{player2[:name]} (#{player2[:symbol]}): #{player2[:score]}"
#   end
# end

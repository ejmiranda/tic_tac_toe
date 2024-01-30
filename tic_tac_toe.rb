# frozen_string_literal: true

require_relative 'game'

# The classic paper and pencil game
class TicTacToe < Game
  attr_accessor :positions

  WINNER_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
  ].freeze

  def start
    play_game
  end

  private

  def play_game
    super(name: 'Tic Tac Toe')
    loop do
      play_round
      break unless play_again?
    end
    print_banner(text: 'Thank you for playing!')
  end

  def play_round
    super
    self.positions = *(1..9)
    set_players_ids(ids: %w[X 0])
    loop do
      print_board
      play_turn
      break if winner? || valid_positions.empty?

      swap_current_player
    end
    end_round
  end

  def play_turn
    pos = get_valid_value(
      prompt: "Pick a position #{current_player.name}",
      valid_values: valid_positions,
      invalid_msg: 'Sorry, try again.'
    )
    positions[pos.to_i - 1] = current_player.id
    puts
    print_separator
  end

  def valid_positions
    positions.map do |position|
      position.to_s if position != 'X' && position != '0'
    end.compact
  end

  def winner?
    self.winner = current_player if winner_combinations.any? do |w_comb|
      ([positions[w_comb[0]], positions[w_comb[1]], positions[w_comb[2]]].count current_player.id) == 3
    end
  end

  def end_round
    update_score unless winner.nil?
    print_board
    if !winner.nil?
      puts "The winner is #{winner.name}!"
    else
      puts "It's a draw!"
    end
    puts
  end

  def update_score
    current_player.points += 1
  end

  # Printer Methods

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
end

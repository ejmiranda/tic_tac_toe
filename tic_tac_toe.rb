# frozen_string_literal: true

require_relative 'game'
require 'matrix'

# The classic paper and pencil game
class TicTacToe < Game
  attr_accessor :positions

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

  def winner? # rubocop:disable Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/PerceivedComplexity
    pos = positions
    winner_combination = Array.new(3, current_player.id)
    matrix = Matrix[pos[0..2], pos[3..5], pos[6..9]]
    self.winner = current_player if
      matrix.row_vectors.reduce(true) { |result, rv| result || rv.to_a == winner_combination } ||
      matrix.column_vectors_vectors.reduce(true) { |result, cv| result || cv.to_a == winner_combination } ||
      matrix.each(:diagonal).to_a == winner_combination ||
      winner_combination == [pos[2], pos[4], pos[6]]

    # winner_combination = Array.new(3, current_player.id)
    # pos = positions
    # # [1, 2, 3, 4, 5, 6, 7, 8, 9]
    # # case 1: 1, 2, 3 <- Top Row
    # self.winner = current_player if
    # winner_combination == pos[0..2] ||
    # # case 2: 4, 5, 6 <- Mid Row
    # winner_combination == pos[3..5] ||
    # # case 3: 7, 8, 9 <- Bottom Row
    # winner_combination == pos[6..8] ||
    # # case 4: 1, 4, 7 <- Left Column
    # winner_combination == [pos[0], pos[3], pos[6]] ||
    # # case 5: 2, 5, 8 <- Mid Column
    # winner_combination == [pos[1], pos[4], pos[7]] ||
    # # case 6: 3, 6, 9 <- Right Column
    # winner_combination == [pos[2], pos[5], pos[8]] ||
    # # case 7: 1, 5, 9 <- Top Left to Bottom Right
    # winner_combination == [pos[0], pos[4], pos[8]] ||
    # # case 8: 3, 5, 7 <- Top Right to Bottom Left
    # winner_combination == [pos[2], pos[4], pos[6]]
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

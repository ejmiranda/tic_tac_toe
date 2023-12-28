# frozen_string_literal: true

# Class to play the classic paper and pencil game
class TicTacToe
  attr_accessor :positions, :player_x, :player_0

  def initialize
    @positions = (1..9).to_a
    @player_x = { name: '', score: '', symbol: 'X'}
    @player_0 = { name: '', score: '', symbol: '0'}
  end

  def start
    set_game
  end

  private

  def set_game
    puts 'WELCOME TO TIC TAC TOE'
    p player_x
    p player_0
    gets
  end

  def play_game
  end

  def play_round
  end

  def draw_board
    puts "#{positions[0]} | #{positions[1]} | #{positions[2]}"
    puts '--+---+---'
    puts "#{positions[3]} | #{positions[4]} | #{positions[5]}"
    puts '--+---+---'
    puts "#{positions[6]} | #{positions[7]} | #{positions[8]}"
  end
end

game = TicTacToe.new
game.start

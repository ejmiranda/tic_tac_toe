# frozen_string_literal: true

require_relative 'player'
require_relative 'input_output'
require 'colorize'

# Any 2-Player turn-based game
class Game
  include InputOutput

  attr_reader :player1, :player2
  attr_accessor :current_player, :winner

  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @current_player = @player1
  end

  private

  def play_game(name:)
    print_banner(text: "Welcome to #{name}")
    set_players_names
  end

  def set_players_names
    players.each_with_index do |player, idx|
      puts "Enter the name for Player #{idx + 1}"
      player.name = gets.chomp
      puts
    end
  end

  def play_round
    self.winner = nil
  end

  def set_players_ids(ids:)
    current_player.id = get_valid_value(
      prompt: "#{current_player.name}, #{ids.first} or #{ids.last}?",
      valid_values: ids,
      invalid_msg: "Sorry, that\'s not valid. Please try again.\n",
      up_case: true
    )
    other_player.id = current_player.id == ids.first ? ids.last : ids.first
    puts "\n"
    print_separator
  end

  def play_turn; end

  def play_again?
    get_valid_value(
      prompt: 'Do you want to play again (Y/N)?',
      valid_values: %w[Y N],
      invalid_msg: "Sorry, that\'s not valid. Please try again.\n",
      up_case: true
    ) == 'Y'
  end

  # Helper Methods

  def players
    [player1, player2]
  end

  def other_player
    current_player == player1 ? player2 : player1
  end

  def swap_current_player
    self.current_player = other_player
  end
end

# frozen_string_literal: true

require_relative 'player'

# Any 2-Player turn-based game
class Game
  attr_reader :player1, :player2
  attr_accessor :current_player, :winner

  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @current_player = @player1
  end

  private

  def play_game; end

  def set_players_names
    players.each_with_index do |player, idx|
      puts "Enter the name for Player #{idx + 1}"
      # player.name = gets.chomp
      player.name = "Player #{idx + 1}"
      puts player.name
      puts
    end
  end

  def play_round; end

  def set_players_ids(ids:)
    # current_player.id = get_valid_value(
    #   prompt: "#{current_player.name}, #{ids.first} or #{ids.last}?",
    #   valid_values: ids,
    #   invalid_msg: "Sorry, that\'s not valid. Please try again.\n",
    #   up_case: true
    # )
    # other_player.id = current_player.id == ids.first ? ids.last : ids.first
    player1.id = 'X'
    player2.id = '0'
    print_separator
  end

  def players
    [player1, player2]
  end

  def other_player
    current_player == player1 ? player2 : player1
  end

  def swap_current_player
    self.current_player = other_player
  end

  def print_score # rubocop:disable Metrics/AbcSize
    puts "#{current_player == player1 ? '>' : ' '} #{player1.name} (#{player1.id}): #{player1.points}"
    puts "#{current_player == player2 ? '>' : ' '} #{player2.name} (#{player2.id}): #{player2.points}"
  end
end

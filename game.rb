# frozen_string_literal: true

require_relative 'player'

# Any 2-Player turn based game
class Game
  attr_reader :players

  def initialize(player_qty:)
    @players = []
    player_qty.times do
      @players.push(Player.new)
    end
  end

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
end

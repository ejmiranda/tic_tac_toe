# frozen_string_literal: true

require_relative 'player'

# Any game
class Game
  def select_players(players)
    players.each_with_index do |player, idx|
      puts "Enter the name for Player #{idx + 1}"
      player.name = gets.chomp
      puts
    end
  end
end

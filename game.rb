# frozen_string_literal: true

require_relative 'player'

# Any game
class Game
  def get_players_names(players)
    players.each_with_index do |player, idx|
      puts "Enter the name for Player #{idx + 1}"
      player.name = gets.chomp
      puts
    end
  end
end

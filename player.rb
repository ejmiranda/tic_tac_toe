# frozen_string_literal: true

# Someone who plays Tic Tac Toe
class Player
  attr_accessor :name, :symbol, :points

  def initialize(name = '', symbol = '', points = 0)
    @name = name
    @symbol = symbol
    @points = points
  end
end

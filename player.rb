# frozen_string_literal: true

# Any player in any game
class Player
  attr_accessor :name, :id, :points

  def initialize(name = '', id = '', points = 0)
    @name = name
    @id = id
    @points = points
  end
end

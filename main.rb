class TicTacToe

  def initialize
    @positions = (1..9).to_a
  end

  def print_board
    puts "X | 0 | 0"
    puts "---------"
    puts "0 | X | 0"
    puts "---------"
    puts "0 | 0 | X"
    puts " Yay: #{@positions}"
  end

end

game = TicTacToe.new
game.print_board

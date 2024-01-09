# frozen_string_literal: true

# The classic paper and pencil game
class TicTacToe
  attr_accessor :positions, :player_x, :player_o, :current_player

  def initialize
    @positions = (1..9).to_a
    @player_x = { name: '', score: 0, symbol: 'X' }
    @player_o = { name: '', score: 0, symbol: '0' }
    @current_player = player_x
  end

  def start
    set_game
    play_game
  end

  private

  def set_game
    puts
    puts '----------------------'
    puts 'WELCOME TO TIC TAC TOE'
    puts '----------------------'
    puts
    select_players
    puts
    puts '----------------------'
  end

  def select_players
    puts 'Who chooses X?'
    # player_x[:name] = gets.chomp
    player_x[:name] = 'Edgar'
    puts player_x[:name]
    puts
    puts 'Who chooses 0?'
    # player_o[:name] = gets.chomp
    player_o[:name] = 'Lucas'
    puts player_o[:name]
  end

  def play_game
    loop do
      draw_board
      play_turn
    end
  end

  def play_turn
    puts "Pick a position #{current_player[:name]}"
    pos = gets.chomp.to_i
    if valid_position?(pos)
      positions[pos - 1] = current_player[:symbol]
    else
      puts 'Sorry, that one is not valid.'
      puts
    end
    self.current_player = current_player == player_o ? player_x : player_o
  end

  def valid_position?(_pos)
    true
  end
end

def draw_board
  puts
  draw_score
  puts
  puts "#{positions[0]} | #{positions[1]} | #{positions[2]}"
  puts '--+---+---'
  puts "#{positions[3]} | #{positions[4]} | #{positions[5]}"
  puts '--+---+---'
  puts "#{positions[6]} | #{positions[7]} | #{positions[8]}"
  puts
end

def draw_score
  puts "#{current_player == player_x ? '>' : ' '} #{player_x[:name]}: #{player_x[:score]}"
  puts "#{current_player == player_o ? '>' : ' '} #{player_o[:name]}: #{player_o[:score]}"
end

game = TicTacToe.new
game.start

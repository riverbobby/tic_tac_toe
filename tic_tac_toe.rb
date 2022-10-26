# frozen_string_literal: true

require 'pry-byebug'

# class for player where name is either 'X' or 'O'
class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

# class for creating ascii board
class Board
  attr_accessor :one, :two, :three, :four, :five, :six, :seven, :eight, :nine

  def initialize
    @one = 1
    @two = 2
    @three = 3
    @four = 4
    @five = 5
    @six = 6
    @seven = 7
    @eight = 8
    @nine = 9
  end

  def print_board
    puts "     |     |\n"\
         "  #{seven}  |  #{eight}  |  #{nine}\n"\
         "_____|_____|_____\n"\
         "     |     |\n"\
         "  #{four}  |  #{five}  |  #{six}\n"\
         "_____|_____|_____\n"\
         "     |     |\n"\
         "  #{one}  |  #{two}  |  #{three}\n     |     |"
  end
end

player_x = Player.new('X')
player_o = Player.new('O')
board = Board.new

board.print_board

board.one = player_x.name
board.five = player_o.name
board.print_board

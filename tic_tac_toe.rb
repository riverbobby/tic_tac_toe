# frozen_string_literal: true

require 'pry-byebug'

# class for creating ascii board
class Board
  attr_accessor :spaces

  def initialize
    @spaces = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def print_board
    puts "     |     |\n"\
         "  #{spaces[6]}  |  #{spaces[7]}  |  #{spaces[8]}\n"\
         "_____|_____|_____\n"\
         "     |     |\n"\
         "  #{spaces[3]}  |  #{spaces[4]}  |  #{spaces[5]}\n"\
         "_____|_____|_____\n"\
         "     |     |\n"\
         "  #{spaces[0]}  |  #{spaces[1]}  |  #{spaces[2]}\n     |     |"
  end
end

# class to contain the game
class Game
  attr_reader :play

  def initialize
    @player_x = 'X'
    @player_o = 'O'
    @board = Board.new
    @turn = @player_x
    @play = true
  end

  def print_turn
    @board.print_board
    puts "It is player #{@turn}'s turn\n"\
         'enter an open number followed by enter to make your move'
  end

  def make_move(move)
    if move.between?(1, 9)
      if @board.spaces[move - 1] == move
        @board.spaces[move - 1] = @turn
        @play = continue?
      else
        puts "Space #{move} is not available!"
      end
    else
      puts 'Please enter an valid number!'
    end
  end

  def print_winner
    @board.print_board
    puts "Player #{@turn} has won the game!"
  end

  def print_tie
    @board.print_board
    puts 'Tie game!'
  end

  private

  def toggle_turn
    @turn = if @turn == @player_x
              @player_o
            else
              @player_x
            end
  end

  def continue?
    if @board.spaces[0..2].all? { |space| space == @turn } ||
       @board.spaces[3..5].all? { |space| space == @turn } ||
       @board.spaces[6..8].all? { |space| space == @turn } ||
       (@board.spaces[0] == @turn && @board.spaces[3] == @turn && @board.spaces[6] == @turn) ||
       (@board.spaces[1] == @turn && @board.spaces[4] == @turn && @board.spaces[7] == @turn) ||
       (@board.spaces[2] == @turn && @board.spaces[5] == @turn && @board.spaces[8] == @turn) ||
       (@board.spaces[0] == @turn && @board.spaces[4] == @turn && @board.spaces[8] == @turn) ||
       (@board.spaces[2] == @turn && @board.spaces[4] == @turn && @board.spaces[6] == @turn)
      print_winner
      false
    elsif @board.spaces.all? { |space| space.is_a?(String) }
      print_tie
      false
    else
      toggle_turn
      true
    end
  end
end

game = Game.new

while game.play
  game.print_turn
  move = gets.chomp.to_i
  game.make_move(move)
end

# frozen_string_literal: true

require 'pry-byebug'

spaces = [1, 2, 3, 4, 5, 6, 7, 8, 9]

def print_board(spaces)
  puts "     |     |\n"\
       "  #{spaces[6]}  |  #{spaces[7]}  |  #{spaces[8]}\n"\
       "_____|_____|_____\n"\
       "     |     |\n"\
       "  #{spaces[3]}  |  #{spaces[4]}  |  #{spaces[5]}\n"\
       "_____|_____|_____\n"\
       "     |     |\n"\
       "  #{spaces[0]}  |  #{spaces[1]}  |  #{spaces[2]}\n"\
       "     |     |"
end

print_board(spaces)
spaces[0] = 'X'
spaces[4] = 'X'
spaces[8] = 'X'
print_board(spaces)
print_board(spaces)

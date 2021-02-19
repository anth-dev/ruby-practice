# frozen_string_literal: true

require 'pry'

# We need a chessboard. (maybe not!)
class ChessBoard
  attr_reader :board

  def initialize
    @board = Array.new(8) { Array.new(8, '') }
  end


end

# We need a knight.
class Knight
  # Take the origin and start building a subtree of nodes of every possible
  #   move as child nodes. Be sure to check that the moves would be o the board
  #   with each node having up to 8 possible children.
  
  def knight_moves(origin, destination, level = 0)
    binding.pry

    # Generate a network of possible moves to look for the destination.
  end
end

# Driver script

test_knight = Knight.new
p test_knight.knight_moves([2, 1], [1, 5])

# Expected output
#   [2, 1]
#   [0, 2]
#   [2, 3]
#   [1, 5]

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
  #   move as child nodes. Be sure to check that the moves would be on the board
  #   with each node having up to 8 possible children.
  
  def knight_moves(origin, destination, move_chain = [])

    binding.pry

    # Once we get to the destination, return the move_chain.
    return move_chain if origin == destination

    # If this space has already been visited or is off the board return instead
    #   of continuing. (We hit a dead end.)
    return if move_chain.include?(origin) || origin.any? { |coord| coord.negative? || coord > 7 }

    queue = Array.new(queue_possible_moves(origin))

    'pickle rick'
  end

  private

  def queue_possible_moves(origin)
    possible_moves = []
    possible_moves << [origin[0] - 1, origin[1] - 2] # p0
    possible_moves << [origin[0] - 2, origin[1] - 1] # p1
    possible_moves << [origin[0] - 2, origin[1] + 1] # p2
    possible_moves << [origin[0] - 1, origin[1] + 2] # p3
    possible_moves << [origin[0] + 1, origin[1] + 2] # p4
    possible_moves << [origin[0] + 2, origin[1] + 1] # p5
    possible_moves << [origin[0] + 2, origin[1] - 1] # p6
    possible_moves << [origin[0] + 1, origin[1] - 2] # p7
  end
end

# Driver script

test_knight = Knight.new()
p test_knight.knight_moves([2, 1], [1, 5])

# Expected output
#   [2, 1]
#   [0, 2]
#   [2, 3]
#   [1, 5]

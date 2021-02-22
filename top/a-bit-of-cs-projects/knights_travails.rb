# frozen_string_literal: true


# We need a chessboard. (maybe not!)
class ChessBoard
  attr_reader :board

  def initialize
    @board = Array.new(8) { Array.new(8, '') }
  end


end

# We need a knight.
class Knight
  
  def knight_moves(origin, destination, move_chain = [])

    

    # Once we get to the destination, return the move_chain.
    return move_chain << origin if origin == destination

    # If this space has already been visited or is off the board return instead
    #   of continuing. (We hit a dead end.)
    return if move_chain.include?(origin) || origin.any? { |coord| coord.negative? || coord > 7 }

    # Once we have passed the base cases above, add where we are to the move
    #   chain.
    move_chain << origin

    # Create a queue of each possible move from here.
    queue = Array.new(queue_possible_moves(origin))

    # Before starting to go through the queue we should check to see if the
    #   queue contains our destination.
    return move_chain << destination if queue.include?(destination)

    until queue.empty?
      moves_to_destination = knight_moves(queue.first, destination, move_chain)

      if moves_to_destination.nil?
        queue.shift
        next
      end

      # We are getting to a point where moves_to_destination returns eventually
      #   with an array containing one possible solution
      return moves_to_destination

    end
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
p test_knight.knight_moves([0, 0], [3, 3])

p test_knight.knight_moves([0, 0], [1, 2])

p test_knight.knight_moves([3, 3], [0, 0])

p test_knight.knight_moves([3, 3], [4, 3])


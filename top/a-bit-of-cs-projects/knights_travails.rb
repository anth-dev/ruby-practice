# frozen_string_literal: true


# We need a chessboard. (maybe not!)
class ChessBoard
  attr_reader :board

  def initialize
    @board = Array.new(8) { Array.new(8, ' ') }
  end

  def pretty_print
    puts '7' + '|' + @board[0][7] + '|' + @board[1][7] + '|' + @board[2][7] + '|' + @board[3][7] + '|' + @board[4][7] + '|' + @board[5][7] + '|' + @board[6][7] + '|' + @board[7][7] + '|'
    puts '6' + '|' + @board[0][6] + '|' + @board[1][6] + '|' + @board[2][6] + '|' + @board[3][6] + '|' + @board[4][6] + '|' + @board[5][6] + '|' + @board[6][6] + '|' + @board[7][6] + '|'
    puts '5' + '|' + @board[0][5] + '|' + @board[1][5] + '|' + @board[2][5] + '|' + @board[3][5] + '|' + @board[4][5] + '|' + @board[5][5] + '|' + @board[6][5] + '|' + @board[7][5] + '|'
    puts '4' + '|' + @board[0][4] + '|' + @board[1][4] + '|' + @board[2][4] + '|' + @board[3][4] + '|' + @board[4][4] + '|' + @board[5][4] + '|' + @board[6][4] + '|' + @board[7][4] + '|'
    puts '3' + '|' + @board[0][3] + '|' + @board[1][3] + '|' + @board[2][3] + '|' + @board[3][3] + '|' + @board[4][3] + '|' + @board[5][3] + '|' + @board[6][3] + '|' + @board[7][3] + '|'
    puts '2' + '|' + @board[0][2] + '|' + @board[1][2] + '|' + @board[2][2] + '|' + @board[3][2] + '|' + @board[4][2] + '|' + @board[5][2] + '|' + @board[6][2] + '|' + @board[7][2] + '|'
    puts '1' + '|' + @board[0][1] + '|' + @board[1][1] + '|' + @board[2][1] + '|' + @board[3][1] + '|' + @board[4][1] + '|' + @board[5][1] + '|' + @board[6][1] + '|' + @board[7][1] + '|'
    puts '0' + '|' + @board[0][0] + '|' + @board[1][0] + '|' + @board[2][0] + '|' + @board[3][0] + '|' + @board[4][0] + '|' + @board[5][0] + '|' + @board[6][0] + '|' + @board[7][0] + '|'
    puts '  ' + '0 ' + '1 ' + '2 ' + '3 ' + '4 ' + '5 ' + '6 ' + '7 '
  end
end

# We need a knight.
class Knight
  
  def knight_moves(origin, destination)

  end

  private

  def find_adjacent(origin)
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

  def to_str
    'k'
  end
end

# Driver script

# Create a game board and a knight.

game_board = ChessBoard.new

game_board.board[2][7] = Knight.new
game_board.board[3][3] = Knight.new
game_board.pretty_print


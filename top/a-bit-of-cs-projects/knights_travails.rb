# frozen_string_literal: true

# This class is for chess board objects.
class ChessBoard
  attr_reader :board

  def initialize
    @board = Array.new(8) { Array.new(8, ' ') }
  end

  def pretty_print
    puts "7|#{@board[0][7]}|#{@board[1][7]}|#{@board[2][7]}|#{@board[3][7]}|#{@board[4][7]}|#{@board[5][7]}|#{@board[6][7]}|#{@board[7][7]}|"
    puts "6|#{@board[0][6]}|#{@board[1][6]}|#{@board[2][6]}|#{@board[3][6]}|#{@board[4][6]}|#{@board[5][6]}|#{@board[6][6]}|#{@board[7][6]}|"
    puts "5|#{@board[0][5]}|#{@board[1][5]}|#{@board[2][5]}|#{@board[3][5]}|#{@board[4][5]}|#{@board[5][5]}|#{@board[6][5]}|#{@board[7][5]}|"
    puts "4|#{@board[0][4]}|#{@board[1][4]}|#{@board[2][4]}|#{@board[3][4]}|#{@board[4][4]}|#{@board[5][4]}|#{@board[6][4]}|#{@board[7][4]}|"
    puts "3|#{@board[0][3]}|#{@board[1][3]}|#{@board[2][3]}|#{@board[3][3]}|#{@board[4][3]}|#{@board[5][3]}|#{@board[6][3]}|#{@board[7][3]}|"
    puts "2|#{@board[0][2]}|#{@board[1][2]}|#{@board[2][2]}|#{@board[3][2]}|#{@board[4][2]}|#{@board[5][2]}|#{@board[6][2]}|#{@board[7][2]}|"
    puts "1|#{@board[0][1]}|#{@board[1][1]}|#{@board[2][1]}|#{@board[3][1]}|#{@board[4][1]}|#{@board[5][1]}|#{@board[6][1]}|#{@board[7][1]}|"
    puts "0|#{@board[0][0]}|#{@board[1][0]}|#{@board[2][0]}|#{@board[3][0]}|#{@board[4][0]}|#{@board[5][0]}|#{@board[6][0]}|#{@board[7][0]}|"
    puts '  0 1 2 3 4 5 6 7'
  end
end

# This class makes knight chess pieces.
class Knight
  def initialize(location)
    @location = location
  end

  def knight_moves(destination)
    level = { @location => 0 }
    parent = { @location => nil }
    i = 1
    frontier = [@location]

    until frontier.empty?
      next_location = []
      frontier.each do |discovered|
        find_adjacent_moves(discovered).each do |adjacent_move|
          next unless level.none? { |key, value| key == adjacent_move }

          level[adjacent_move] = i
          parent[adjacent_move] = discovered
          next_location.push(adjacent_move)
        end
      end

      frontier = next_location
      i += 1
    end

    puts "You made it in #{level[destination]} moves!"

    path_stack = []
    path_stack << destination
    path_stack << parent[path_stack.last] until parent[path_stack.last].nil?

    until path_stack.empty?
      p path_stack.last
      path_stack.pop
    end
  end

  private

  def find_adjacent_moves(here)
    adjacent_moves = []
    adjacent_moves << [here[0] - 1, here[1] - 2]
    adjacent_moves << [here[0] - 2, here[1] - 1]
    adjacent_moves << [here[0] - 2, here[1] + 1]
    adjacent_moves << [here[0] - 1, here[1] + 2]
    adjacent_moves << [here[0] + 1, here[1] + 2]
    adjacent_moves << [here[0] + 2, here[1] + 1]
    adjacent_moves << [here[0] + 2, here[1] - 1]
    adjacent_moves << [here[0] + 1, here[1] - 2]

    adjacent_moves.filter do |move|
      (move[0] >= 0 && move[0] <= 7) && (move[1] >= 0 && move[1] <= 7
                                        )
    end
  end

  def to_s
    'k'
  end
end

# Driver script

game_board = ChessBoard.new

game_board.board[3][3] = Knight.new([3, 3])
game_board.pretty_print

p game_board.board[3][3]

game_board.board[3][3].knight_moves([4, 3])

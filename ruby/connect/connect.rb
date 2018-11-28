class Board
  attr_reader :board

  def initialize(board)
    @board = board.map { |rows| rows.gsub(/ /, '').chars }.transpose
  end

  def winner
    return 'X' if x_won
    return 'O' if o_won
    ''
  end

  # private

    def generate_range(num, max)
      ((num - 1)..(num + 1)).reject { |n| n < 0 or n > max }
    end

    # Returns a list of all adjacent tiles
    def adjacencies(x, y, player)
      generate_range(x, @board.length - 1).flat_map { |newx|
        generate_range(y, @board[0].length - 1).map { |newy|
          next if newx - x == 0 and newy - y == 0
          next if newx - x == -1 and newy - y == -1
          next if newx - x == 1 and newy - y == 1
          next if @checked[newx][newy]
          [newx, newy] if @board[newx][newy] == player }.compact }.compact
    end

    # Returns whether or not x has won
    def x_won
     if x_edges 
       @checked = Array.new(@board.length) { Array.new(@board[0].length, false) }
       @board.transpose.each_with_index.any? { |y, i| 
         y[0] == 'X' ? x_recursive_search(0,i) : false }
     end
    end

    # Returns whether or not there is an x on both left and right edges
    def x_edges
      @board[0].include? 'X' and @board[-1].include? 'X'
    end

    # Returns whether or not x has a path from left to right
    def x_recursive_search(x, y)
      return true if x == @board.length - 1
      @checked[x][y] = true
      adjacencies(x,y,'X').any? { |newx, newy|
        x_recursive_search(newx, newy) }
    end

    # Returns whether or not o has won
    def o_won
      if o_edges
       @checked = Array.new(@board.length) { Array.new(@board[0].length, false) }
       @board.each_with_index.any? { |x, i|
         x[0] == 'O' ? o_recursive_search(i,0) : false }
      end
    end

    # Returns whether or not there is an o on both top and bottom edges
    def o_edges
      @board.transpose[0].include? 'O' and @board.transpose[-1].include? 'O'
    end

    # Returns whether or not o has a pat from top to bottom
    def o_recursive_search(x, y)
      return true if y == @board.transpose.length - 1
      @checked[x][y] = true
      adjacencies(x,y,'O').any? { |newx, newy|
        o_recursive_search(newx, newy) }
    end
end

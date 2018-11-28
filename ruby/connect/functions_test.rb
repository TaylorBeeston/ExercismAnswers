require 'minitest/autorun'
require_relative 'connect'

class ConnectTest < Minitest::Test
  def test_adjacencies_function
    board = [
      'XYX',
      'YYY',
      'XXX',
    ]
    game = Board.new(board)
    assert_equal [[1,2]], game.adjacencies(0,2,'X')
    assert_equal [[1,0],[1,1]], game.adjacencies(0,1,'Y')
    assert_equal [[0,0],[0,2],[1,2],[2,0],[2,2]], game.adjacencies(1,1,'X')
    assert_equal [], game.adjacencies(0,0,'Z')
  end

  def test_x_recursive_search
    board = [
      'XXX',
      'YYY',
      'YYY'
    ]
    game = Board.new(board)
    assert game.x_recursive_search(0,0)
    refute game.x_recursive_search(0,2)
  end
end

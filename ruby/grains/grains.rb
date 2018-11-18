class Grains
  ALL_SQUARES = 1..64

  def self.square(num)
    raise ArgumentError unless ALL_SQUARES.cover?(num)
    2 ** (num - 1)
  end

  def self.total
    ALL_SQUARES.sum { |num| square(num) }
  end
end

class Queens
  def initialize(queens_hash)
    queens_hash.each_value { |pos| pos.each { |value| 
      raise ArgumentError if value < 0 or value > 7 } }
    @queens = queens_hash
  end

  def attack?
    vertical? or horizontal? or diagonal?
  end

  private

    def vertical?
      @queens[:black][1] == @queens[:white][1]
    end

    def horizontal?
      @queens[:black][0] == @queens[:white][0]
    end

    def diagonal?
      first_diff = (@queens[:black][0] - @queens[:white][0]).abs
      second_diff = (@queens[:black][1] - @queens[:white][1]).abs
      first_diff == second_diff
    end
end

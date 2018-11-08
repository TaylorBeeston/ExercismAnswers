class Matrix

  attr_reader :rows, :columns

  def initialize(matrix)
    @matrix = string_to_matrix(matrix)
    @rows = @matrix
    @columns = @matrix.transpose
  end

  private
    # Returns [[1,2],[3,4],[5,6]] from "1 2/n3 4/n 5 6"
    def string_to_matrix(string)
      to_nums(string.split("\n").map { |row| row.strip.split })
    end

    # Returns [[1,2],[3,4]] from [["1","2"],["3,"4"]]
    def to_nums(matrix)
      matrix.map { |row| row.map(&:to_i) }
    end
end

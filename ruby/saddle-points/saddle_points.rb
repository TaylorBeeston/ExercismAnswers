class Matrix
  attr_reader :rows, :columns

  def initialize(matrix_string)
    @matrix = matrix_string.split("\n").map { |row| row.split.map(&:to_i) }
    @rows = @matrix
    @columns = @matrix.transpose
  end

  def saddle_points
    points = []
    for row in 0..@rows.length - 1
      for col in 0..@columns.length - 1
        current = @matrix[row][col]
        if @rows[row].max == current and @columns[col].min == current
          points << [row, col]
        end
      end
    end
    points
  end
end

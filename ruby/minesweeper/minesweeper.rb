class Board
  def self.transform(input)
    @input = sanitize(input)
    input.map.with_index { |line, index| convert_line(line, index) }
  end

  private

    VALID_CHARS = "+-| *"

    # Checks for proper formatting
    def self.sanitize(input)

      correct_border = "+#{"-" * (input[0].length - 2)}+"

      unless input[0] == correct_border and input[-1] == correct_border
        raise ArgumentError 
      end

      input.each { |line|
        raise ArgumentError unless line.length == input[0].length
        line.each_char { |char|
          raise ArgumentError unless VALID_CHARS.include?(char) } }
    end

    # Converts blanks to bomb counts for a whole line
    def self.convert_line(line, x)
      line.chars.map.with_index { |char, y|
        char = surrounding_bombs(x, y) if char == " "
        char }.join
    end

    # Returns the number of bombs surrounding a coordinate
    def self.surrounding_bombs(x, y)
      bombs = 0
      (-1..1).each do |roffset|
        (-1..1).each do |coffset|
          bombs += 1 if @input[x + roffset][y + coffset] == "*"
        end
      end
      bombs == 0 ? " " : bombs.to_s
    end
end

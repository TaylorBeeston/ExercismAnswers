class Robot
  attr_reader :bearing, :coordinates

  def initialize
    @directions = [:north, :east, :south, :west]
  end

  def orient(direction)
    raise ArgumentError unless @directions.include?(direction)
    @bearing = direction
  end

  def at(x, y)
    @coordinates = [x,y]
  end

  def advance
    case @bearing
    when :north then @coordinates[1] += 1
    when :east  then @coordinates[0] += 1
    when :south then @coordinates[1] -= 1
    when :west then @coordinates[0] -= 1
    end
  end

  def turn_right
    current_index = @directions.find_index(@bearing)
    @bearing = @directions[(current_index + 1) % @directions.length]
  end
  
  def turn_left
    @bearing = @directions[@directions.find_index(@bearing) - 1]
  end
end

class Simulator
  def instructions(instructions_string)
    instructions_string.chars.map { |instruction| decrypt(instruction) }
  end

  def place(robot, parameters)
    robot.at(parameters[:x], parameters[:y])
    robot.orient(parameters[:direction])
  end

  def evaluate(robot, instructions_string)
    instructions(instructions_string).each { |command| robot.send(command) }
  end

  private

    def decrypt(instruction)
      case instruction
      when 'L' then :turn_left
      when 'R' then :turn_right
      when 'A' then :advance
      end
    end
end

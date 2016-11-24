require './robot'

# Simulate the controller of a robot and the table environment
# Author:: Ethan Xingyu Ji
# Attributes:
# +map+:: the table size simulator possess
# +robot+:: involved robot in this simulator

class Simulator
  attr_accessor :map, :robot
  attr_reader :robot_put_flag

  def initialize map
    @map = map
    @robot = Robot.new(-1, -1, "NORTH")
    @robot_put_flag = false
    @robot.map = @map
  end

  def input_command command
    if command =~ /^PLACE\s\d+,\d+,SOUTH$|NORTH$|WEST$|EAST$/
      x, y, f = command.scan(/(\d+(?=,))|(\w+$)/)
      x_value = x[0].to_i
      y_value = y[0].to_i
      # detect if the robot will be placed off table
      if x_value < @map["x_max"] && y_value < @map["y_max"]
        @robot.x_coordinate = x_value;
        @robot.y_coordinate = x_value;
        @robot.direction = f[1];
        @robot_put_flag = true
      else
        puts "Robot will fall off the table!"
      end
    elsif @robot_put_flag
      case command
        when "MOVE"
          @robot.move
        when "LEFT"
          @robot.turn_around "LEFT"
        when "RIGHT"
          @robot.turn_around "RIGHT"
        when "REPORT"
          puts @robot
          exit(0)
      end
    end
  end

end

if __FILE__ == $0
  simulator = Simulator.new({"x_max" => 5, "y_max" => 5})
  while 1
    simulator.input_command gets.chomp
  end
end

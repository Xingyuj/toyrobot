# Simulate a robot's behaviours
# Author:: Ethan Xingyu Ji
# Attributes:
# +x_coordinate+:: current x coordinate of robot
# +y_coordinate+:: current y coordinate of robot
# +direction+:: current direction the robot facing
# +map+:: the table size robot currently on

class Robot
  attr_accessor :x_coordinate, :y_coordinate, :direction, :map
  @@directions = ["NORTH", "EAST", "SOUTH", "WEST"]

  def initialize x, y, f
    self.x_coordinate = x
    self.y_coordinate = y
    self.direction = f
  end

  def direction=(value)
    @direction = @@directions.index(value)
  end

  def direction
    @@directions[@direction]
  end

  def to_s
    "Output: " + @x_coordinate.to_s + "," + @y_coordinate.to_s + "," + @@directions[@direction]
  end

  def move

    case @direction
      when 0
        # A timid robot, if do not give him a map, he will not step forward but draw back
        @y_coordinate += 1 if @map != nil && @y_coordinate + 1 < @map["y_max"]
      when 1
        @x_coordinate += 1 if @map != nil && @x_coordinate + 1 < @map["x_max"]
      when 2
        @y_coordinate -= 1 if @y_coordinate - 1 >= 0
      when 3
        @x_coordinate -= 1 if @x_coordinate - 1 >= 0
    end
  end

  def turn_around direction
    case direction
      when "RIGHT"
        @direction = (@direction + 1) % 4
      when "LEFT"
        @direction = (@direction - 1) % 4
    end
  end

end

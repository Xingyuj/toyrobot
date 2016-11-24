require "spec_helper"
require_relative "../robot"

describe Robot do

  context "when detect edge" do
    let(:map) { {"x_max" => 5, "y_max" => 5} }
    let(:robot) { robot = Robot.new(4, 0, "EAST"); robot.map = map; robot }

    it "expect not move exceed x_max" do
      robot.move
      expect(robot.x_coordinate).to eq 4
    end
    it "expect not move to x -1" do
      robot.direction = "SOUTH"
      robot.move
    end
    it "expect not move to y -1" do
      robot.direction = "SOUTH"
      robot.move
      expect(robot.y_coordinate).to eq 0
    end
    it "expect not move exceed y_max" do
      robot.y_coordinate = 4
      robot.direction = "NORTH"
      robot.move
      expect(robot.y_coordinate).to eq 4
    end
  end

  describe "#move" do
    let(:map) { {"x_max" => 5, "y_max" => 5} }
    let(:robot) { robot = Robot.new(0, 0, "NORTH"); robot.map = map; robot }
    context "when facing north" do
      it "should increase y by 1 unit" do
        robot.move
        expect(robot.y_coordinate).to eq 1
      end
    end
    context "when facing south" do
      it "should decrease y by 1 unit" do
        robot.direction = "SOUTH"
        robot.move
        expect(robot.y_coordinate).to eq 0
      end
    end
    context "when facing east" do
      it "should increase x by 1 unit" do
        robot.direction = "EAST"
        robot.move
        expect(robot.x_coordinate).to eq 1
      end
    end
    context "when facing west" do
      it "should decrease x by 1 unit" do
        robot.direction = "WEST"
        robot.move
        expect(robot.x_coordinate).to eq 0
      end
    end
  end

  describe "#turn_around" do
    let(:map) { {"x_max" => 5, "y_max" => 5} }
    let(:robot) { robot = Robot.new(1, 1, "NORTH"); robot.map = map; robot }

    context "when facing north" do
      it "should turn to west after turn left" do
        robot.turn_around "LEFT"
        expect(robot.direction).to eq "WEST"
      end
      it "should turn to east after turn right" do
        robot.turn_around "RIGHT"
        expect(robot.direction).to eq "EAST"
      end
      it "should not change coordinates" do
        expect(robot.x_coordinate).to eq 1
        expect(robot.y_coordinate).to eq 1
      end
    end

    context "when facing south" do
      let(:robot_south) { robot.direction = "SOUTH"; robot }
      it "should turn to east after turn left" do
        robot_south.turn_around "LEFT"
        expect(robot_south.direction).to eq "EAST"
      end
      it "should turn to west after turn right" do
        robot_south.turn_around "RIGHT"
        expect(robot_south.direction).to eq "WEST"
      end
    end

    context "when facing east" do
      let(:robot_east) { robot.direction = "EAST"; robot }
      it "should turn to NORTH after turn left" do
        robot_east.turn_around "LEFT"
        expect(robot_east.direction).to eq "NORTH"
      end
      it "should turn to SOUTH after turn right" do
        robot_east.turn_around "RIGHT"
        expect(robot_east.direction).to eq "SOUTH"
      end
    end

    context "when facing west" do
      let(:robot_west) { robot.direction = "WEST"; robot }
      it "should turn to south after turn left" do
        robot_west.turn_around "LEFT"
        expect(robot_west.direction).to eq "SOUTH"
      end
      it "should turn to north after turn right" do
        robot_west.turn_around "RIGHT"
        expect(robot_west.direction).to eq "NORTH"
      end
    end

  end

end
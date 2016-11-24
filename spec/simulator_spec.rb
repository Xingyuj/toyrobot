require "spec_helper"
require_relative "../simulator"

describe Simulator do

  describe "#input_command" do
    let(:simulator) { Simulator.new({"x_max" => 5, "y_max" => 5}) }

    context "when input invalid command" do
      it "xPLACE 1,1,SOUTH do nothing" do
        simulator.input_command "xPLACE 1,1,SOUTH"
        expect(simulator.robot_put_flag).to be false
      end
      it "PLACE 1s,1,SOUTH do nothing" do
        simulator.input_command "PLACE 1s,1,SOUTH"
        expect(simulator.robot_put_flag).to be false
      end
      it "PLACE 1,1,SOUT do nothing" do
        simulator.input_command "PLACE 1,1,SOUT"
        expect(simulator.robot_put_flag).to be false
      end
    end

    context "when input valid command" do
      it "expect place a robot" do
        simulator.input_command "PLACE 1,1,SOUTH"
        expect(simulator.robot_put_flag).to be true
        expect(simulator.robot.direction).to eq "SOUTH"
      end
    end

    context "when other commands run before PLACE command" do
      it "expect MOVE not change coordinate" do
        simulator.input_command "MOVE"
        # Robot initial default coordinates are -1 -1
        expect(simulator.robot.x_coordinate).to eq -1
        expect(simulator.robot.y_coordinate).to eq -1
      end

      it "expect LEFT not change robot direction" do
        simulator.input_command "LEFT"
        # Robot initial default direction is NORTH
        expect(simulator.robot.direction).to eq "NORTH"
      end

      it "expect RIGHT not change robot direction" do
        simulator.input_command "RIGHT"
        expect(simulator.robot.direction).to eq "NORTH"
      end
    end

    context "when put a robot off the table" do
      it "expect to avoid x >= x_max" do
        simulator.input_command "PLACE 5,0,NORTH"
        expect(simulator.robot.x_coordinate).not_to eq 5
      end
      it "expect to avoid x < 0" do
        simulator.input_command "PLACE -1,0,NORTH"
        expect(simulator.robot.x_coordinate).not_to eq -1
      end
      it "expect to avoid y >= y_max" do
        simulator.input_command "PLACE 0,5,NORTH"
        expect(simulator.robot.y_coordinate).not_to eq 5
      end
      it "expect to avoid y < 0" do
        simulator.input_command "PLACE 0,-1,NORTH"
        expect(simulator.robot.y_coordinate).not_to eq -1
      end
    end

  end

end
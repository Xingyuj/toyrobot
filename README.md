## Toy Robot Simulator
- The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement
that would result in the robot falling from the table must be prevented, however further valid movement commands must still
be allowed.

## Usage
To run the program
```
ruby simulator.rb
```

## Unit Testing
To run the tests you will first need to install Rspec with:
```
gem install rspec
```
Then to run the tests (located in the 'spec/' directory)
```
rspec spec/simulator_spec.rb
rspec spec/robot_spec.rb
```

require './Dive'

test = Dive.new("forward 5
down 5
forward 8
up 3
down 8
forward 2")

test.run_course
test.run_aimed_course
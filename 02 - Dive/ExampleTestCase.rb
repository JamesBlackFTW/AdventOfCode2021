require './Dive'

testcase = Dive.new(["forward 5","down 5","forward 8","up 3","down 8","forward 2"])
testcase.run_course
testcase.run_aimed_course
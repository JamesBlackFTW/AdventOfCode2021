require './Dive'

testcase = Dive.new(File.readlines('./testdata.txt'))
testcase.run_aimed_course
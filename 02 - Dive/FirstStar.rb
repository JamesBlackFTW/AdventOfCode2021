require './Dive'

test = Dive.new(File.readlines('./testdata.txt'))
test.run_course
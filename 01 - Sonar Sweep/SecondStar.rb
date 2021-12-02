require './SonarSweep'

testcase = TestCase.new(File.readlines('./testdata.txt'))
testcase.count_rolling_depths()

require './BingoSubsystem'

testcase = BingoSubsystem.new(File.read('./ExampleTestCase.txt'))
p testcase.play_bingo

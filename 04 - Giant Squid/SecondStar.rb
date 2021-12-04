require './BingoSubsystem'

testcase = BingoSubsystem.new(File.read('./TestCase.txt'))
p testcase.play_backwards_bingo

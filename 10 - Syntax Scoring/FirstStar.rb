require_relative 'NavigationSubsystem'

navSystem = NavigationSubsystem.new(File.read('./TestCase.txt'))
p navSystem.score_corruptions
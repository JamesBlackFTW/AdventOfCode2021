require_relative 'NavigationSubsystem'

navSystem = NavigationSubsystem.new(File.read('./ExampleTestCase.txt'))
p navSystem.score_corruptions
p navSystem.fix_lines
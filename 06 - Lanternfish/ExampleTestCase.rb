require_relative 'LanternfishCalculator'

school = LanternfishCalculator.new(File.read('./ExampleTestCase.txt'))
p school.calculateExponential(80)

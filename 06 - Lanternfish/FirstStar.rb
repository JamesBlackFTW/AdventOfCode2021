require_relative 'LanternfishCalculator'

school = LanternfishCalculator.new(File.read('./TestCase.txt'))
p school.calculateExponential(80)


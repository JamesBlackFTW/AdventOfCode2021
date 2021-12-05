require_relative 'HydroThermometer'

hydrothermometer = HydroThermometer.new(File.read('./TestCase.txt'))
p hydrothermometer.countOverlapsWithDiagonals
require './HydroThermometer'

hydrothermometer = HydroThermometer.new(File.read('./ExampleTestCase.txt'))

p hydrothermometer.countOverlapsWithDiagonals

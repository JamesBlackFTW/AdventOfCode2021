require_relative 'SmokeBasin'

segmentSelector = SmokeBasin.new(File.read('./ExampleTestCase.txt'))
p segmentSelector.get_risk_levels
p segmentSelector.get_basin_areas
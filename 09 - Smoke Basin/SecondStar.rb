require_relative 'SmokeBasin'

segmentSelector = SmokeBasin.new(File.read('./TestCase.txt'))
p segmentSelector.get_basin_areas
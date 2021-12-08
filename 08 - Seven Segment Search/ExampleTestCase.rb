require_relative 'SegmentSelector'

segmentSelector = SegmentSelector.new(File.read('./ExampleTestCase.txt'))
p segmentSelector.count_unique_length_values

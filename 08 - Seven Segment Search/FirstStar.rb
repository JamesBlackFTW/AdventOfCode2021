require_relative 'SegmentSelector'

segmentSelector = SegmentSelector.new(File.read('./TestCase.txt'))
p segmentSelector.count_unique_length_values

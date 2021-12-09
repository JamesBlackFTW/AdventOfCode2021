require_relative 'SegmentSelector'

segmentSelector = SegmentSelector.new(File.read('./TestCase.txt'))
p segmentSelector.get_full_number

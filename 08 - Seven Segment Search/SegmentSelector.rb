require_relative 'Instruction.rb'

class SegmentSelector
  def initialize(input)
    lines = input.split("\n")
    @data = lines.map do |line|
      Instruction.new(line)
    end
  end

  def count_unique_length_values
    @data.map do |instruction|
      instruction.count_unique_length_values
    end.sum
  end

  def get_full_number
    @data.map do |instruction|
      instruction.get_full_number
    end.sum
  end
end

class Instruction
  def initialize(line)
    data = line.split("|")
    @signalPattern = data[0].split(" ")
    @output = data[1].split(" ")
  end

  def count_unique_length_values
    @output.select { |x|
      (x.length == 2 || x.length == 3 || x.length == 4 || x.length == 7)
    }.count
  end
end

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
end

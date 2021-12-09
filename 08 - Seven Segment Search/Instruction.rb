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

  def get_full_number
    one = @signalPattern.select { |x| x.length == 2 }.map(&:chars).flatten
    four = @signalPattern.select { |x| x.length == 4 }.map(&:chars).flatten
    value = ""

    @output.map(&:chars).each do |instruction|
      case instruction.length
      when 2
        value += "1"
      when 3
        value += "7"
      when 4
        value += "4"
      when 5
        if (one - instruction).empty?
          value += "3"
        elsif (four - instruction).count == 1
          value += "5"
        else
          value += "2"
        end
      when 6
        if (four - instruction).empty?
          value += "9"
        elsif (one - instruction).empty?
          value += "0"
        else
          value += "6"
        end
      when 7
        value += "8"
      end
    end
    value.to_i
  end
end

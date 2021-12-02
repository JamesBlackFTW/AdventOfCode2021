class Dive
  def initialize(input)
    @input = input.split("
")
  end

  def run_course
    position = 0
    depth = 0
    (0..@input.count).each { |i|
      command = @input[i].to_s.split(" ")
      step = command[0]
      value = command[1]

      case step
      when "forward"
        position = position + value.to_f
      when "up"
        depth = depth - value.to_f
      when "down"
        depth = depth + value.to_f
      end
    }

    p depth * position
  end

  def run_aimed_course
    position = 0
    depth = 0
    aim = 0
    (0..@input.count).each { |i|
      command = @input[i].to_s.split(" ")
      step = command[0]
      value = command[1]

      case step
      when "forward"
        position = position + value.to_f
        depth = depth + (aim * value.to_f)
      when "up"
        aim = aim - value.to_f
      when "down"
        aim = aim + value.to_f
      end
    }

    p depth * position
  end
end
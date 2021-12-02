class Dive
  def initialize(input)
    @input = input.map { |string| string.split(' ') }
  end

  def run_course
    position = 0
    depth = 0
    @input.each do |step, value|
      case step
      when "forward"
        position = position + value.to_i
      when "up"
        depth = depth - value.to_i
      when "down"
        depth = depth + value.to_i
      end
    end

    p depth * position
  end

  def run_aimed_course
    position = 0
    depth = 0
    aim = 0
    @input.each do |step, value|
      case step
      when "forward"
        position = position + value.to_f
        depth = depth + (aim * value.to_f)
      when "up"
        aim = aim - value.to_f
      when "down"
        aim = aim + value.to_f
      end
    end

    p depth * position
  end
end
class CrabOrganiser
  def initialize(input)
    @data = input.split(",").map(&:to_i).sort!
    @median = @data[@data.count / 2]
    @mean = @data.reduce(:+) / @data.size
    p @mean
  end

  def travel
    @data.map do |value|
      (value - @median).abs
    end.sum
  end

  def true_travel
    @data.map do |value|
      sum = (value - @mean).abs
      sum * (sum + 1) / 2
    end.sum
  end
end

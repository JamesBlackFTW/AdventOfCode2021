class LanternfishCalculator
  def initialize(input)
    data = input.split(",").map(&:to_i)

    @school = Hash.new(0)
    @school[1] = data.select{|x| x == 1}.count
    @school[2] = data.select{|x| x == 2}.count
    @school[3] = data.select{|x| x == 3}.count
    @school[4] = data.select{|x| x == 4}.count
    @school[5] = data.select{|x| x == 5}.count
    @school[6] = data.select{|x| x == 6}.count
  end

  def calculateExponential(days)
    (1..days).map do
      temp = Hash.new(0)
      @school.each do |day, count|
        if day == 0
          temp[6] += count
          temp[8] += count
        else
          temp[day-1] += count
        end
      end
      @school = temp
    end
    @school.values.sum
  end
end

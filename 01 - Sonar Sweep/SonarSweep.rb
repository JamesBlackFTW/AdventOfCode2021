class TestCase
  def initialize(input)
    @input = input
  end

  def count_depths
    count = 0
    (0..@input.count).each { |i|

      if i == 0
        /Do nothing/
      else
        if @input[i].to_f > @input[i-1].to_f
          count = count + 1
        end
      end
    }

    p count
  end

  def count_rolling_depths
    count = 0
    (0..@input.count).each { |i|
      if i+1 > @input.count or i+2 > @input.count or i+3 > @input.count
        /do nothing/
      else
        if get_rolling_depth(i) > get_rolling_depth(i-1)
          count = count + 1
        end
      end
    }
      p count
  end

  def get_rolling_depth(i)
    (@input[i].to_f + @input[i+1].to_f + @input[i+2].to_f)
  end
end
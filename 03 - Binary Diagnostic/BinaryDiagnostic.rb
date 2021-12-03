class BinaryDiagnosticMachine
  def initialize(input)
    @input = input.split("\n")
                  .map(&:chars)
  end

  def solve_simple_diagnostic
    binaryString = @input.transpose.map do | col |
      zeros = col.select.count {|x| x == "0"}
      if zeros > (col.count / 2)
        "0"
      else
        "1"
      end
    end

    gamma = binaryString.join.to_i(2)
    epsilon = gamma ^ (2**12 - 1)

    p gamma * epsilon
  end

  def solve_advanced_diagnostic
    oxygen = solve_oxygen_diagnostic
    carbon = solve_carbon_diagnostic
    p oxygen * carbon
  end

  private def solve_oxygen_diagnostic
    binaryString = @input

    (0..@input.count).each { |i|
      mostPopular = solve_most_popular_bit(binaryString, i)
      binaryString = binaryString.select {|val| val[i] == mostPopular }
      if binaryString.length == 1
        return binaryString[0].join.to_i(2)
      end
    }
  end

  private def solve_carbon_diagnostic
    binaryString = @input

    (0..@input.count).each { |i|
      leastPopular = solve_least_popular_bit(binaryString, i)
      binaryString = binaryString.select {|val| val[i] == leastPopular }
      if binaryString.length == 1
        return binaryString[0].join.to_i(2)
      end
    }
  end

  private def solve_most_popular_bit(input, index)
    zeroCount = 0
    input.each do |value|
      if value[index] == "0"
        zeroCount = zeroCount + 1
      end
    end

    if zeroCount <= (input.count / 2)
      return '1'
    else
      return '0'
    end
  end

  private def solve_least_popular_bit(input, index)
    zeroCount = 0
    input.each do |value|
      if value[index] == "0"
        zeroCount = zeroCount + 1
      end
    end

    if zeroCount > (input.count / 2)
      return '1'
    else
      return '0'
    end
  end
end
class BinaryDiagnosticMachine
  def initialize(input)
    @input = input.map{|v| v.split("")}
    @length = input[0].length-2
  end

  def solve_simple_diagnostic
    binaryString = ""
    (0..@length).each { |i|
      binaryString = binaryString + solve_most_popular_bit(@input, i)
    }

    gamma = binaryString.to_i(2)
    epsilon = binaryString.gsub("0","2").gsub("1","0").gsub("2","1").to_i(2)

    p gamma * epsilon
  end

  def solve_advanced_diagnostic
    oxygen = solve_oxygen_diagnostic
    carbon = solve_carbon_diagnostic
    p oxygen * carbon
  end

  private def solve_oxygen_diagnostic
    binaryString = @input

    (0..@length).each { |i|
      mostPopular = solve_most_popular_bit(binaryString, i)
      binaryString = binaryString.select {|val| val[i] == mostPopular }
      if binaryString.length == 1
        return binaryString[0].join.to_i(2)
      end
    }
  end

  private def solve_carbon_diagnostic
    binaryString = @input

    (0..@length).each { |i|
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
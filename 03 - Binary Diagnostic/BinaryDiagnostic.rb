class BinaryDiagnosticMachine
  def initialize(input)
    @input = input.split("\n")
                  .map(&:chars)
  end

  def solve_simple_diagnostic
    binaryString = @input.transpose.map do | col |
      solve_most_popular_bit(col)
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
    array = @input.clone
    @input.size.times do |i|
      filterVal = solve_most_popular_bit(array.transpose[i])
      array.select! {|val| val[i] == filterVal }
      if array.length == 1
        break
      end
    end

    return array[0].join.to_i(2)
  end

  private def solve_carbon_diagnostic
    array = @input.clone
    @input.size.times do |i|
      filterVal = solve_least_popular_bit(array.transpose[i])
      array.select! {|val| val[i] == filterVal }

      if array.length == 1
        break
      end
    end

    return array[0].join.to_i(2)
  end

  private def solve_most_popular_bit(input)
    zeros = input.select.count {|x| x == "0"}
    if zeros > (input.count / 2)
      "0"
    else
      "1"
    end
  end

  private def solve_least_popular_bit(input)
    zeros = input.select.count {|x| x == "0"}
    if zeros <= (input.count / 2)
      "0"
    else
      "1"
    end
  end
end
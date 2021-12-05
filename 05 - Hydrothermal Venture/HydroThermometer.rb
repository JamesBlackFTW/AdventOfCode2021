class HydrothermalArray
  def initialize(input)
    @linePositions = input.split("->").map { |coordinates| coordinates.split(",").map(&:to_i) }
  end

  def get_all_positions
    allPoints = []

    if (!is_non_diagonal)
      xPoints = [@linePositions[0][0], @linePositions[1][0]]

      xdirection = @linePositions[0][0] < @linePositions[1][0] ? +1 : -1
      ydirection = @linePositions[0][1] < @linePositions[1][1] ? +1 : -1

      i = 0
      while (xPoints.min + i) <= xPoints.max
        allPoints.push(to_s(@linePositions[0][0] + (xdirection * i), @linePositions[0][1] + (ydirection * i)))
        i += 1
      end
      return allPoints
    end

    if (x_matches)
      x = @linePositions[0][0]
      points = [@linePositions[0][1], @linePositions[1][1]]
      (points.min..points.max).map do |y|
        allPoints.push(to_s(x,y))
      end
    end

    if (y_matches)
      y = @linePositions[0][1]
      points = [@linePositions[0][0], @linePositions[1][0]]
      (points.min..points.max).map do |x|
        allPoints.push(to_s(x,y))
      end
    end

    return allPoints
  end

  def is_non_diagonal
    x_matches || y_matches
  end

  private def x_matches
    @linePositions[0][0] == @linePositions[1][0]
  end

  private def y_matches
    @linePositions[0][1] == @linePositions[1][1]
  end

  private def to_s(x, y)
    "#{x},#{y}"
  end
end

class HydroThermometer
  def initialize(input)
    @arrayCollection = []
    input.split("\n").map do |line|
      @arrayCollection.push(HydrothermalArray.new(line))
    end
  end

  def countOverlaps
    allPositions = @arrayCollection.select { |hydroArray| hydroArray.is_non_diagonal }.map { |val| val.get_all_positions }.flatten
    allPositions.group_by(&:itself).map { |key, value| [key, value.count] }.count { |_, value| value >= 2 }
  end

  def countOverlapsWithDiagonals
    allPositions = @arrayCollection.map { |val| val.get_all_positions }.flatten
    allPositions.group_by(&:itself).map { |key, value| [key, value.count] }.count { |_, value| value >= 2 }
  end
end

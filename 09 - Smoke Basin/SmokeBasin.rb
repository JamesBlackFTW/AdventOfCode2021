require 'set'

class SmokeBasin
  def initialize(input)
    @lines = input.split("\n")
    @data = @lines.map {|line| line.chars.map(&:to_i)}
    @maxX = @lines.length-1
    @maxY = @lines[0].length - 1
  end

  def get_risk_levels
    lowPositions = get_low_positions
    lowPositions.map do |x, y|
      (@data[x][y] + 1)
    end.sum
  end

  def get_basin_areas
    lowPositions = get_low_positions
    lowPositions.map do |x, y|
      seen = Set.new
      get_basin(x,y,seen)
      seen.count
    end.sort.last(3).inject(:*)
  end

  private def get_low_positions
    lowPositions = Array.new
    @data.each_with_index do |row, x|
      row.each_with_index do |_, y|
        neighbors = [[0,1], [0,-1], [1, 0], [-1, 0]]
                      .map { |nX, nY| [nX + x, nY + y] }
                      .filter{ |fX, _| fX.between?(0, @maxX)}
                      .filter{ |_, fY| fY.between?(0, @maxY)}


        if neighbors.filter { |fX, fY| @data[fX][fY] <= @data[x][y]}.empty?
          lowPositions.push([x,y])
        end
      end
    end
    return lowPositions
  end

  private def get_basin(x, y, seen)
    seen.add([x,y])
    neighbors =  [[0,1], [0,-1], [1, 0], [-1, 0]]
                   .map { |nX, nY| [nX + x, nY + y] }
                   .filter{ |fX, _| fX.between?(0, @maxX)}
                   .filter{ |_, fY| fY.between?(0, @maxY)}
                   .filter{ |fPos| seen.select{ |sPos| fPos == sPos }.empty?}
                   .filter{ |fX, fY| @data[fX][fY] != 9 }

    neighbors.map do |x, y|
      get_basin(x,y, seen)
    end
  end
end

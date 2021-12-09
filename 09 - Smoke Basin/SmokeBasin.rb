class SmokeBasin
  def initialize(input)
    @lines = input.split("\n")
    @data = @lines.map {|line| line.chars.map(&:to_i)}
  end

  def get_risk_levels
    low = 0
    @data.each_with_index do |row, x|
      row.each_with_index do |_, y|
        neighbors = [[0,1], [0,-1], [1, 0], [-1, 0]]
                      .map { |nX, nY| [nX + x, nY + y] }
                      .filter{ |fX, _| fX.between?(0, @lines.length-1)}
                      .filter{ |_, fY| fY.between?(0, row.length - 1)}


        if neighbors.filter { |fX, fY| @data[fX][fY] <= @data[x][y]}.empty?
          low += (@data[x][y]+1)
        end
      end
    end
    return low
  end

end

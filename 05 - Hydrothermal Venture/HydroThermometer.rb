require_relative 'HydrothermalArray.rb'

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

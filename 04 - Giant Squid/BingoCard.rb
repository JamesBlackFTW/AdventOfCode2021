class BingoCard
  def initialize()
    @card = []
  end

  def add_line(line)
    @card.push(line.split(" ").map{|str| str.to_i})
  end

  def card_is_complete(input)
    @card.map do | row |
      if (row - input).empty?
        return true
      end
    end

    @card.transpose.map do | row |
      if (row - input).empty?
        return true
      end
    end
    return false
  end

  def get_remaining_score(input)
    return (@card.flatten - input).sum
  end
end

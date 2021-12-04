require 'csv'
require './BingoCard'

class BingoSubsystem
  def initialize(input)
    lines = input.split("\n")
    @numbers = []
    @cards = []
    currentCard = nil

    lines.each_with_index.map do |line, idx|
      if idx == 0
        @numbers = CSV.parse(line)[0].map { |s| s.to_i }
      else
        if line == ""
          if currentCard != nil
            @cards.push(currentCard)
          end
          currentCard = BingoCard.new()
        else
          currentCard.add_line(line)
        end
      end
    end
    @cards.push(currentCard)
  end

  def play_bingo()
    subset = []
    @numbers.take_while { |x|
      subset.push(x)
      @cards.select { |card| card.card_is_complete(subset) }.empty?
    }

    winningCard = @cards.select { |card| card.card_is_complete(subset) }.first
    subset.last * winningCard.get_remaining_score(subset)
  end

  def play_backwards_bingo()
    subset = @numbers
    winningCards = @cards.select { |card| card.card_is_complete(@numbers) }
    lastRemoved = 0

    @numbers.reverse.take_while {
      lastRemoved = subset.pop
      (winningCards - winningCards.select { |card| card.card_is_complete(subset) }).empty?
    }

    winningCard = (winningCards - winningCards.select { |card| card.card_is_complete(subset) }).first
    subset.push(lastRemoved)
    lastRemoved * winningCard.get_remaining_score(subset)
  end
end

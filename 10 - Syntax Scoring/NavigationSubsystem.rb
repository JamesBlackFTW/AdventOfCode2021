class NavigationSubsystem
  def initialize(input)
    @lines = input.split("\n")
    @data = @lines.map(&:chars)
    @openingChars = ['(', '[', '{', '<']
  end

  def score_corruptions
    @data.map do |line|
      process_line(line)
    end.sum
  end

  def fix_lines
    fixed_totals = @data.select{|line| process_line(line) == 0}.map do |line|
      fix_line(line)
    end.sort
    return fixed_totals[fixed_totals.length / 2]
  end

  private def process_line(line)
    stack = Array.new
    line.map do |char|
      if @openingChars.filter{ |c| c == char}.any?
        stack.push(char)
      else
        item = stack.last
        case char
        when ')'
          stack.pop
          next if item == "(";
          return 3
        when ']'
          stack.pop
          next if item == "["
          return 57
        when '}'
          stack.pop
          next if item == "{"
          return 1197
        when '>'
          stack.pop
          next if item == "<"
          return 25137
        end
      end
    end
    return 0
  end

  private def fix_line(line)
    stack = Array.new
    line.map do |char|
      if @openingChars.filter{ |c| c == char}.any?
        stack.push(char)
      else
        stack.pop
      end
    end

    total = 0
    stack.reverse.map do | item |
      total *= 5
      case item
      when '('
        total += 1
      when '['
        total += 2
      when '{'
        total += 3
      when '<'
        total += 4
      end
    end
    return total
  end
end


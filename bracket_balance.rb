require 'pry-byebug'
def solution(s)
  # left_side  = ""
  # right_side = ""
  s.each_char.with_index do |_, idx|

    left_side  = s[0..idx]
    right_side = s[(idx + 1)..-1]

    left_side_opening_count  = left_side.count('(')
    right_side_closing_count = right_side.count(')')

    if left_side_opening_count == right_side_closing_count
      return idx + 1
    end
  end
end

def faster_solution(s)
  left_side_opening_count  = 0
  right_side_closing_count = s.count(")")

  0.upto(s.length - 1) do |i|
    left_side  = s[0..i]
    right_side = s[(i + 1)..-1]

    if s[i]    == "("
      left_side_opening_count  += 1
    elsif s[i] == ")"
      right_side_closing_count -= 1
    end

    return i + 1 if left_side_opening_count == right_side_closing_count
  end
end


# p faster_solution("(())")    == 2
# p faster_solution("(())))(") == 4
# p faster_solution("))")      == 2
# p faster_solution(")(")      == 1
# p faster_solution("")        == 0

max_mult = 25_000
new_string = "(())" * max_mult
p solution(new_string) == (2 * max_mult)

def faster_solution(s)
  left_side_opening_count  = 0
  right_side_closing_count = s.count(")")
  starting_right_side_count = right_side_closing_count

  0.upto(s.length - 1) do |i|
    # binding.pry
    left_side  = s[0..i]
    right_side = s[(i + 1)..-1]

    if s[i]    == "("
      left_side_opening_count  += 1
    elsif s[i] == ")"
      right_side_closing_count -= 1
    end

    if left_side_opening_count == right_side_closing_count
      return i + 1
    end
  end
  starting_right_side_count
end

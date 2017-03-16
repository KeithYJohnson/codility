require 'pry-byebug'
def solution(n)
  bin =  "%b" % n # Returns binary as string "%b" % 9 => "1001"

  max_gap     = 0
  current_gap = 0
  in_gap      = false
  bin.each_char.with_index do |char, idx|

    # Beginning of what could possibly be a binary gap
    if char == "1" && !in_gap
      in_gap = true
      next
    end

    # Increment the length of what could possibly be a binary gap
    if in_gap && char == "0"
      current_gap += 1
    end

    # We know this is the end of a binary gap.
    if in_gap && char == "1"
      in_gap = false
      max_gap = current_gap if current_gap > max_gap

      # This could also be the beginning of another gap though

      # Not neccessary to set in_gap to false on line 23
      # But I think it makes it clearer how the code is operating
      current_gap = 0
      in_gap      = true
    end
  end

  max_gap
end

p solution(9)   == 2
p solution(529) == 4
p solution(20)  == 1
p solution(15)  == 0

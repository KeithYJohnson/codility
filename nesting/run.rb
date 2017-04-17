require 'pry-byebug'
def solution(s)
  stack = []

  s.each_char do |c|
    if c == "("
      stack << c
    elsif c == ")"
      if stack.last == "("
        stack.pop
      else
        return 0
      end
    end
  end

  1 if stack.empty?
end

p solution('(()(())())')
p solution('())')

BRACKETS = {
  '(': ')',
  '[': ']',
  '{': '}',
}

def solution(s)
  stack = []

  s.each_char do |c|
    if BRACKETS.keys.include?(c.to_sym)
      stack << c
    elsif BRACKETS.values.include?(c)
      return 0 if stack.empty? # first bracket char is a closing char
      if BRACKETS[stack.last.to_sym] == c
        stack.pop
      else
        return 0
      end
    end
  end

  if stack.empty?
    1
  else
    0
  end
end

# p solution(')()(')   == 0
# p solution('(VW{})') == 13
# s = "(" * 100_000 +  ")" * 100_000 + ")("
# p solution(s) == 0
#
# s = "(" * 100_000 +  ")" * 100_000
# p solution(s) == 1

# simple large negative test, 10K+1 ('s followed by 10K )'s + )( + ()

s = "(" * 10_001 + ")" * 10_000 + ")(" + "()"
p solution(s) == 0

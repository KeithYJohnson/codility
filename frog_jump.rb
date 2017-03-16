def solution(from_pos, to_pos, stride)
  ((to_pos - from_pos) / stride.to_f).ceil
end


# X = 10
# Y = 85
# D = 30
# the function should return 3,

p solution(10, 85, 30)

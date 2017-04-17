def solution(arr_a, arr_b)
  stack = []
  num_survivors = 0

  arr_a.zip(arr_b).each do |current_fish_size, direction|
    if heading_upstream?(direction)
      stack << current_fish_size
    else
      while stack.any? && current_fish_size > stack.last
        stack.pop
      end
      num_survivors += 1 if stack.empty?
    end
  end
  stack.length + num_survivors
end

def heading_upstream?(direction)
  direction == 1
end

# Given from README
a = [4, 3, 2, 1, 5]
b = [0, 1, 0, 0, 0]

p solution(a, b)

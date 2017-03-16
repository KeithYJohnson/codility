# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

# O(n**2)
def solution(x, a)
  river = [nil] * x

  a.each_with_index do |elem, idx|
    river[elem - 1] = true if elem <= a.length
    if river.compact.length == river.length
      return idx
    end
  end
  -1
end

# O(n)
def faster_solution(x, a)
  added = {}
  sum   = 0
  total = (1..x).inject(:+)

  a.each_with_index do |elem, idx|
    if elem > x || added.has_key?(elem)
      next
    else
      added[elem] = true
      sum += elem
      return idx if sum == total
    end
  end
  -1
end

# Found this on GitHub, it's even better
# https://github.com/mrhead/codility/blob/master/frog_river_one.rb



a = [1, 3, 1, 4, 2, 3, 5, 4]
p faster_solution(5, a) == 6

a = [1,2,3,5,5,5,5,5,4]
p faster_solution(4, a) == 8
#
a = [1]
p faster_solution(1, a) == 0
# #
a = [1,2]
p faster_solution(3, a) == -1

a = [1,2,4]
p faster_solution(3, a) == -1

a = [1, 2, 100_000, 3]
p faster_solution(3, a) == 3

a = [2, 2, 100_000, 3]
p faster_solution(3, a) == -1

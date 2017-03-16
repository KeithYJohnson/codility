def solution(a)
  head     = a[0]
  tail     = a[1..-1].inject(:+)
  min_diff = (head - tail).abs
  # sum_left  = 0
  # sum_right = a.inject(:+)
  1.upto(a.length - 1) do |idx|
    head += a[idx]
    tail -= a[idx]
    new_diff = (head - tail).abs
    min_diff = new_diff if new_diff < min_diff
  end
  min_diff
end


a = [3, 1, 2, 4, 3]
p solution a

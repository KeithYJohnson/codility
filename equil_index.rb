require 'pry-byebug'

def find_eq_idxs(array)
  equil_indx = []
  array.each_with_index do |_, idx|
    left_side  = array[0...idx]
    right_side = array[(idx+1)..-1]
    left_sum   = left_side.inject(:+).to_i   # to_i convert nil to 0
    right_sum  = right_side.inject(:+).to_i  # in case of an empty array

    equil_indx << idx if right_sum == left_sum
  end
  return equil_indx
end

# a = [-1, 3, -4, 5, 1, -6, 2, 1]
# p find_eq_idxs(a)

def equi(a)
  left, right = 0, a.inject{|sum, k| sum += k}

  (0...a.length).each do |j|
    # deduct right part
    right = right - a[j]
    # skip first iterate for left
    left = left + a[j-1] if j > 0

    return j if left == right
  end

  -1
end

p equi([1,1,0,1,10])

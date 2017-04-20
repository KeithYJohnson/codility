require 'pry-byebug'
# A[0] = 3    A[1] = 4    A[2] =  3
# A[3] = 2    A[4] = 3    A[5] = -1
# A[6] = 3    A[7] = 3

def solution(a)
  hash = Hash.new(0)

  a.each_with_index do |e, idx|
    hash[e] += 1
    return idx if hash[e] > a.length / 2.0
  end
  -1
end

a = [3, 4, 3, 2, 3, -1, 3, 3]
p solution(a)
#
# # Remember not to do this Hash.new([]) again - http://stackoverflow.com/questions/2698460/strange-unexpected-behavior-disappearing-changing-values-when-using-hash-defa
# # If a block is specified, it will be called with the hash object and the key, and should return the default value. It is the block’s responsibility to store the value in the hash if required.
# hash = Hash.new { |h, k| h[k] = [] }
# thing = a.each_with_index.inject(hash) do |hash, yielded|
#   elem, idx = yielded
#   hash[elem] << idx
#   p hash
#   hash
# end
# p thing

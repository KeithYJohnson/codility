
def solution(a)
  if a.uniq.length == a.max && a.min == 1
    1
  else
    0
  end
end

p solution([1,3,3])

# a = [4, 1, 3, 2]
# p solution a

# a = [4,1,3]
# p solution(a)4

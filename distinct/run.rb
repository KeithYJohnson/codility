require 'set'

def solution(a)
  s = Set.new([])
  a.each { |e| s << e }
  s.length
end

a = [2,1,1,2,3,1]
p solution(a)

require 'pry-byebug'
def solution(a)
  thing = a.inject(Hash.new(0)) do |hash, value|
    hash[value] += 1
    hash
  end
  thing.each do |key, value|
    return key if value == 1
  end
  0
end

a = [9, 3, 9, 3, 9, 7, 9]
p solution a

a = [9, 3, 9, 3, 9, 9]
p solution a

def solution(a, b, k)
  divisible = 0
  (a..b).each do |e|
    divisible += 1 if e % k == 0
  end
  divisible
end

def faster_solution(a, b, k)
  count = b / k - a / k
  count += 1 if a % k == 0
end


# p solution(6, 11, 2) == 3
p faster_solution(6, 11, 2)

p faster_solution(0, 10, 2) == 5

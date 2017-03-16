def solution(n, a)
  counters = [0] * n
  max      = 0

  a.each do |e|
    if e == n + 1
      counters = [max] * n
    elsif e.between?(1, n)
      counters[e - 1] += 1
      max = counters[e - 1] if counters[e - 1] > max
    end
  end

  counters
end

a = [3, 4, 4, 6, 1, 4, 4]
p solution(5, a) == [3, 2, 2, 4, 2]

p solution(1, [1] * 6) == [6]

p solution(100_000, [1] * 6).uniq == [6,0]

p solution(100_000, (1..100_000).to_a).uniq == [1]

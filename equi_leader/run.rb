#O(n) solution
require 'pry-byebug'
def find_leader(a)
  h = Hash.new(0)

  max_key_value = [nil, 0]
  a.each do |e|
    h[e] += 1
    max_key_value = [e, h[e]] if h[e] > max_key_value[-1]
  end

  if max_key_value[-1] > a.length / 2.0
    max_key_value[0]
  else
    false
  end
end

def solution(a)
  num_equi_leaders = 0

  h = Hash.new(0)

  max_key_value = [nil, 0]
  a.each_with_index do |e, idx|
    h[e] += 1
    max_key_value = [e, h[e]] if h[e] > max_key_value[-1]
    if max_key_value[-1] > a[0..idx].length / 2.0 && other_leader = find_leader(a[(idx+1)..-1])
      num_equi_leaders += 1 if max_key_value[0] == other_leader
      puts "num_equi_leaders: #{num_equi_leaders}"
    end
  end

  num_equi_leaders
end



# a = [4, 3, 4, 4, 4, 2]
a = [4, 4, 2, 5, 3, 4, 4, 4]
p solution(a)

#O(n) solution
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
    puts 'no leader'
  end
end

a = [4, 3, 4, 4, 4, 2]
p find_leader(a)

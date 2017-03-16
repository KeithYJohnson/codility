def find_leader(array)
  array.inject(Hash.new(0)) do |count_hash, e|
    count_hash[e] += 1

    if count_hash[e] > array.length.to_f / 2
      return e
    end

    count_hash
  end
  return -1
end

a = [4, 2, 2, 3, 2, 4, 2, 2, 6, 4]
p find_leader(a)

oa = [1, 1, 1, 50, 1]
p find_leader(oa)


oa = [3, 3, 3, 50, 3]
p find_leader(oa)

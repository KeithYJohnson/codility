a = [4,2,2,5,1,5,8]

def solution(a)
  min_avg = 10_000 # Highest possible average per problem description constraints
  min_avg_starting_idx = nil
  (a.length - 1).times do |i|
    ((i + 1)..(a.length - 1)).to_a.each do |j|
      subarray = a[i..j]
      sum = subarray.inject(:+).to_f
      avg = sum / subarray.length
      if avg < min_avg
        min_avg = avg
        min_avg_starting_idx = i
      end
    end
  end
  min_avg_starting_idx
end


def get_min_avg_two_slice(a)
  previous_values = 0
  min_avg = 10_000
  min_avg_idx = nil

  a.map.with_index do |value, idx|
    previous_values += value
    if idx == 0
      10_000
    else
      avg = previous_values.to_f / (idx + 1)
      if avg < min_avg
        min_avg = avg
        min_avg_idx = idx
        avg
      end
    end
  end

 return min_avg, min_avg_idx
end


# Credit to
# https://github.com/jimii/codility/blob/master/MinAvgTwoSlice/ruby/MinAvgTwoSlice.rb
def faster_solution(a)
  i = 0;
  length = a.length
  min_average = (a[0] + a[1]) / 2.0
  position = 0

  return 0 if length==2

  for i in 2...length do
    # The reason why we only need to check two or three elements slices is
    # that these 'subslice' averages will compose the averages of any larger
    # slices: https://codesays.com/2014/solution-to-min-avg-two-slice-by-codility/
    # So this is more a question about mathematical properties of averages.
    temp1 = (a[i-1] + a[i]) / 2.0
    temp2 = (a[i-2] + a[i-1] + a[i]) / 3.0

    if (temp1 < min_average)
      position = i - 1
      min_average = temp1
    end

    if (temp2 < min_average)
      position = i - 2
      min_average = temp2
    end

  end

  return position
end

p faster_solution(a)

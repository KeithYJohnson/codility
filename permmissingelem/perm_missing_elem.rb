require 'pry-byebug'
def solution(a)
  # write your code in Ruby 2.2
  a.sort!
  (1..a.length).to_a.each_with_index do |e, idx|
    # Handling end of array length
    if idx == a.length - 1
      if a[idx] == a.length + 1
        return a.length
      else
        return a.length + 1
      end
    end

    return e if a[idx] - e != 0
  end
end


a = [2, 3, 1, 5]
p solution(a) == 4

a = [2,3,4,5]
p solution(a) == 1

a = [1,2,3,4]
p solution(a) == 5

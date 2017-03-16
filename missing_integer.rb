def solution(a)
  a.sort!.each_index do |idx|
    reverse_idx      = 0 - idx - 1
    reverse_elem     = a[reverse_idx]
    second_reverse_elem = a[reverse_idx - 1]

    #Handle the case of being on the last element in reverse iteration
    unless second_reverse_elem
      # Must be a positive integer
      return nil if reverse_elem <= 0
      return reverse_elem - 1 if reverse_elem - 1 > 0
    end

    diff = reverse_elem - second_reverse_elem if second_reverse_elem


    if diff && diff > 1 && reverse_elem > 2
      return reverse_elem - 1
    end
  end
  nil
end


a = [1, 3, 6, 4, 1, 2]
p solution(a) == 5

a = [1,3,4]
p solution(a) == 2

a = [2,3,4]
p solution(a) == 1

a = [1,2,3,4]
p solution(a) == nil

a = [3,4,5,6]
p solution(a) == 2
#
a = [-2_147_483_646, 2_147_483_647]
p solution(a) == 2_147_483_646
#
a = [-2_147_483_646, -1]
p solution(a) == nil
#
a = [-1, 1]
p solution(a) == nil

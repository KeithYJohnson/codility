# https://codility.com/programmers/lessons/2-arrays/cyclic_rotation/
def solution(a, num_times)
  rotated_a = [nil] * a.length
  a.each_with_index do |e, idx|
    new_index = (idx + num_times) % a.length
    rotated_a[new_index] = e
  end

  rotated_a
end


a = [3, 8, 9, 7, 6]
a_solution = [9, 7, 6, 3, 8]
p solution a, 3

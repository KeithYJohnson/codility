# https://codility.com/programmers/lessons/2-arrays/cyclic_rotation/

def solution(a, num_rotations):
    rotated_a = [None] * len(a)
    for idx, e in enumerate(a):
        new_idx = (idx + num_rotations) % len(a)
        rotated_a[new_idx] = e

    return rotated_a


A = [3, 8, 9, 7, 6]
print(solution(A, 1))

A = [3, 8, 9, 7, 6]
K = 3

print(solution(A, K))


# Much nicer solution here - https://codesays.com/2016/solution-to-cyclic-rotation-by-codility/

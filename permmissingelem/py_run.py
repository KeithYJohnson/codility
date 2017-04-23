def bf_solution(a):
    if len(a) == 0:
        return 1

    a.sort()
    for idx, e in enumerate(a):
        if idx + 1 != e:
            return idx + 1

    return len(a) + 1


# o(n) as opposed to the O(N * log(N)) bf_solution
#  Credit to https://github.com/wouterken/codility-python/blob/master/codility-perm-missing-elm.py
def solution(a):
    expected = (len(a)+2) * (len(a) + 1)/2
    for a in A:
        expected -= a
    return expected



a = [2,3,1,5]
print(solution(a))
# print(bf_solution([]))
# print(bf_solution([1,3]))
# print(bf_solution([0]))
# print(bf_solution([1]))
# print(bf_solution([5]))
# print(bf_solution([2,3,4,5]))
# print(bf_solution([1,2,3,4]))

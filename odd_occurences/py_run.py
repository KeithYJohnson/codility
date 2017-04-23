# https://codility.com/programmers/lessons/2-arrays/odd_occurrences_in_array/

def solution(a):
    unpaired = set([])
    for num in a:
        if num in unpaired:
            unpaired.remove(num)
        else:
            unpaired.add(num)

    return unpaired.pop()


a = [9,3,9,3,9,7,9]
print(solution(a))

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

# Here's a nice ruby solution, though technically a bit slower - https://github.com/plicjo/codility_exercises/blob/master/odd_occurrences_in_array.rb
# ooooooo and a slick XOR solution is here - https://www.martinkysel.com/codility-oddoccurrencesinarray-solution/

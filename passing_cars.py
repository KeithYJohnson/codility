import time

# 0 represents a car traveling east,
# 1 represents a car traveling west.

# It took 7.451333999633789 seconds to complete
def solution(a):
    passing_cars     = []
    num_passing_cars = 0


    # for idx, car in enumerate(a):
    for idx, car in enumerate(a):
        for oidx, ocar in enumerate(a[idx+1:]):
            if ocar > car:
                num_passing_cars += 1

    if num_passing_cars > 1000000000:
        return -1
    else:
        return num_passing_cars


a        = [0, 1, 0, 1, 1]
expected = len([(0, 1), (0, 3), (0, 4), (2, 3), (2, 4)])
print((solution(a)) == expected)
print(solution([0]) == len([]))
print(solution([1]) == len([]))
print(solution([1,0]) == len([]))
print(solution([0,1]) == len([(0,1)]))

# max_n    = 100000
# max_mult = int(10000 / len(a))
# new_a    = a * max_mult
#
# # A nested function for timing other functions
# start = time.time()
# solution(new_a)
# end = time.time()
# runtime = end - start
# msg = "It took {time} seconds to complete"
# print(msg.format(time=runtime))


# From
# https://github.com/richard-ps/codility/blob/master/passing_cars.py

# Why sum(some_list) is faster than using for Python for loops
# http://stackoverflow.com/questions/24578896/python-built-in-sum-function-vs-for-loop-performance

# The speed difference has risen to over 5 times now.
#
# A for loop is executed as interpreted Python bytecode. sum() loops entirely in C code. The speed difference between interpreted bytecode and C code is large.
#
# In addition, the C code makes sure not to create new Python objects if it can keep the sum in C types instead; this works for int and float results.
#
# The Python version, disassembled, does this:
# So the faster solution is actually still n**2 it just cheats
# a bit having C do the heavy lifting.
def faster_solution(A):
    n_one = sum(A)
    result = 0

    for i in range(0, len(A)-1, 1):
        if A[i] == 1:
            n_one = n_one - 1
        elif A[i] == 0 and result < 1000000000:
            result += n_one
        else:
            return -1

    return result

# Credit to https://codegists.com/snippet/python/passing-carspy_gbazilio_python
# a        = [0, 1, 0, 1, 1]
def fastest_solution(A):
    passing_cars = 0
    east_cars = 0

    for index in range(len(A)):
        print('index: ', index, 'A[index]: ', A[index])
        if A[index] == 1:
            passing_cars += east_cars
            print(passing_cars)
        else:
            east_cars += 1
            print('east_cars: ', east_cars)

        if passing_cars > 1000000000:
            return -1

    return passing_cars if passing_cars <= 1000000000 else -1


print(fastest_solution(a))

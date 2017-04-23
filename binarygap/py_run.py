# https://codility.com/programmers/lessons/1-iterations/binary_gap/
def solution(n):
    binary = bin(n)
    #Indexed at 2 because for some silly reason the bin function
    #Prepends a 0b in front of all binary representations of integers
    max_gap_length = 0
    in_gap         = False
    gap_length     = 0

    for char in binary[2:]:
        if char == "1":
            if in_gap:
                in_gap = False
                if gap_length > max_gap_length:
                    max_gap_length = gap_length

                # Actually dont need to flip the in_gap var twice but
                # in does help demonstrate that a closing "1" is both
                # the end of one gap and start of another gap
                in_gap = True
                gap_length = 0
            else:
                in_gap = True
        else: #char == "0" in this case
            if in_gap:
                gap_length += 1


    return max_gap_length


# basically a Python version of https://github.com/mrhead/codility/blob/master/binary_gap.rb
def simpler_solution(n):
    s = bin(n)[2:]
    l = s.split('1')
    #Take off the ends because these 0's would not be surrounded by 1's
    max_gap = []
    if l[1:-1]:
        max_gap = max(l[1:-1], key=len)
    return len(max_gap)

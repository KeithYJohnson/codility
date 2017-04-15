def solution(s, k):
    return 4

def is_balanced(s):
    stack = []
    for char in s:
        stack.append(char)
        if char == ")":
            try:
                if stack[-2] == "(":
                    stack = stack[0:-2]
                else:
                    return False
            except IndexError:
                return False

    if len(stack) > 0:
        return False
    else:
        return True

print(is_balanced("()")         == True)
print(is_balanced("")           == True)
print(is_balanced(")(")         == False)
print(is_balanced("()))")       == False)
print(is_balanced("()()()()")   == True)

def add(x, y):
    print("x is {0} and y is {1}".format(x, y)
    return x + y  # Return values with a return statement

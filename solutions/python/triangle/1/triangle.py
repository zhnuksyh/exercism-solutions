def isTriangle(sides):
    a, b, c = sides
    if (a + b >= c) and (b + c >= a) and (a + c >= b) and (a > 0) and (b > 0) and (c > 0):
        return True

def equilateral(sides):
    a, b, c = sides

    if isTriangle(sides) != True:
        return False

    return a == b == c
        

def isosceles(sides):
    a, b, c = sides

    if isTriangle(sides) != True:
        return False
    
    return a == b or b == c or a == c

    
def scalene(sides):
    a, b, c = sides

    if isTriangle(sides) != True:
        return False

    return a != b and b != c and a != c 

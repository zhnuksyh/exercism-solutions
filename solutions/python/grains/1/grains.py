def square(number):
    if 1 <= number <= 64:
        return 2 ** (number - 1)
    else:
        raise ValueError("square must be between 1 and 64")

def total():

    board = 64
    grain = 0
    while board >= 1:
        grain += 2 ** (board - 1)
        board -= 1
        
    return grain
    

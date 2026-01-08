def is_armstrong_number(number):
    num_string = str(number)
    num_length = len(num_string)

    total = 0

    for digit in num_string:
        temp_total = int(digit)
        total = total + (temp_total ** num_length)

    return total == number
        

def response(hey_bob):
    if not hey_bob.strip():
        return "Fine. Be that way!"
    elif hey_bob.strip().endswith("?") and hey_bob.strip().isupper():
        return "Calm down, I know what I'm doing!" 
    elif hey_bob.strip().isupper():
        return "Whoa, chill out!"
    elif hey_bob.strip().endswith("?"):
        return "Sure."
    else:
        return "Whatever."
        
    

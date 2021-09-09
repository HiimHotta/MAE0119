import random

#create a random list

def urna ():
    a = 8
    b = 12
    s = []
    for i in range (0, 20):
        x = random.randrange(1, 20)
        
        if (x <= 8 & a > 0) | (b == 0):
            s.append ("a")
            a-=1
        
        else:
            s.append ("b")
            b-=1
            
    return s

def simulate (s):
    for i in range (0,9):
        x = random.randrange(1, len(s))
        result = s.pop(x)

    return result

def experiment (r):
    result = [0, 0]
    for i in range (0, r):
        u = urna()
        x = simulate (u)
        
        if x == "a":
            result[0] += 1
            
        else:
            result[1] += 1
    
    return result
    
print (experiment(100))
    






import random

#create a random list

# Create arandom number based on exercise.

def prob ():
    x = random.uniform (0, 1)
    
    if x <= 0.1:
        return 1.7
        
    elif x <= 0.3:
        return 2.3
        
    elif x <= 0.85:
        return 3.8
        
    return 5.4

def experiment (r):
    result = [0, 0, 0, 0]
    for i in range (0, r):
        x = prob()
        
        if x == 1.7:
            result[0] += 1
        
        elif x == 2.3:
            result[1] += 1
        
        elif x == 3.8:
            result[2] += 1
            
        else:
            result[3] += 1
    
    return result

res = experiment(100)

print ("Tabela de frequência relativa, na ordem do exercicio:")
print (res)

res2 = [res[0], 0, 0, 0]

for i in range (1, 4):
    res2 [i] = res[i] + res2[i-1]
print ("Tabela de frequência acumulada, na ordem do exercicio:")    
print (res2)

    
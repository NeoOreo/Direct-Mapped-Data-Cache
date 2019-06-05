import random
size = int(input())
file = open("C:/Users/user/Desktop/CA CA4/Direct-Mapped-Data-Cache/MainMemory.mem", 'w')
l = []

def decimalToBinary(n):
    return bin(n).replace("0b", "")

for x in range(size + 1):
    #z = random.randrange(1, 4000000000, 1)
    z = x
    #print(y)
    y = decimalToBinary(z)
    l.append( ((32 - len(y)) * "0") + y + " // " + str(z) + "\n")

file.writelines(l)
file.close()

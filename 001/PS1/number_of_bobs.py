s = 'azcbobobegghakl'
num = 0
for i in range(0, len(s) - 2):
    if s[i] + s[i + 1] + s[i + 2] == 'bob':
        num += 1
print('Number of times bob occurs is: ' + str(num))
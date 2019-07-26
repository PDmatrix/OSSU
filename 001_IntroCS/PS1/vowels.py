s = input('Enter your word: ')

vowels = ['a', 'e', 'o', 'i', 'u']
ans = 0
for c in s:
    if c in vowels:
        ans += 1
print("Number of vowels: " + str(ans))
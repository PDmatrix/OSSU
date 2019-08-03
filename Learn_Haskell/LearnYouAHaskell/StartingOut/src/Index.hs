{-# OPTIONS_GHC -Wall #-}


-- First element 5
head [5, 4, 3, 2, 1]

-- Tail list [4, 3, 2, 1]
tail [5, 4, 3, 2, 1]

-- Last element 1
last [5, 4, 3, 2, 1]

-- List without end [5,4,3,2]
init [5, 4, 3, 2, 1]

-- Lenght of the list 5
length [5,4,3,2,1]

-- Check for empty
-- True
null []
-- False
null [1, 2, 3]

-- Reverse a list [1, 2, 3, 4, 5]
reverse [5, 4, 3, 2, 1]

-- Take n elements from beginning of the list [5, 4, 3]
take 3 [5, 4, 3, 2, 1]

-- Drop n elements from beginning of the list [2, 1]
drop 3 [5, 4, 3, 2, 1]

-- Maximum from the list 5
maximum [5, 4, 3, 2, 1]

-- Minimum from the list 1
minimum [5, 4, 3, 2, 1]

-- Sum of the elements 15
sum [5, 4, 3, 2, 1]

-- Product of the elements 6
product [3, 2, 1]

-- Checks if element in list
-- True
4 `elem` [1, 2, 3, 4, 5]
-- False
6 `elem` [1, 2, 3, 4, 5]

-- Ranges
-- [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]  
[1..20]
-- "abcdefghijklmnopqrstuvwxyz"
['a'..'z']
-- "KLMNOPQRSTUVWXYZ"
['K'..'Z']
-- [2,4,6,8,10,12,14,16,18,20]
[2,4..20]
-- [3,6,9,12,15,18]
[3,6..20]

[20,19..1]

-- [0.1,0.3,0.5,0.7,0.8999999999999999,1.0999999999999999]
[0.1, 0.3 .. 1]

-- Infinite cycled list
cycle [1, 2, 3]

-- Ininite cycled list from one element
repeat 5

-- Create list with n element
replicate 4 10

-- List comperhension

-- [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
[x*2 | x <- [1..10]] 

-- With predicate [12, 14, 16, 18, 20]
[x*2 | x <- [1..10], x*2 >= 12]

-- [52,59,66,73,80,87,94]
[ x | x <- [50..100], x `mod` 7 == 3]  

-- Tuples

-- First element of the tuple
fst (1, 2)

-- Second element of the tuple
snd (1, 2)

-- Zip list of pairs
zip [1, 2, 3, 4] "abcd"
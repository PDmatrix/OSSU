{-# OPTIONS_GHC -Wall #-}

module Homework where

-- | Converts `n` to an array of digits
toDigits :: Integer -> [Integer]
toDigits n
  | n <= 0 = []
  | otherwise = toDigits (n `div` 10) ++ [n `mod` 10]

-- | Converts `n` to and reversed array of digits
toDigitsRev :: Integer -> [Integer]
toDigitsRev n
  | n <= 0 = []
  | otherwise = n `mod` 10 : toDigitsRev (n `div` 10)

-- | Doubles every other number beginning from the right
doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther [] = []
doubleEveryOther [e] = [e]
doubleEveryOther (x:y:zs)
  | even (length zs) = x * 2 : y : doubleEveryOther zs
  | otherwise = x : y * 2 : doubleEveryOther zs

-- | Calculating the sum of all digits in list
-- sumDigits [] = 0s
-- sumDigits (x:xs) = x `mod` 10 + x `div` 10 + sumDigits xs
sumDigits :: [Integer] -> Integer
sumDigits = foldr helper 0
  where
    helper x = (+) ((x `mod` 10) + (x `div` 10))

-- | Checking whether an integer could be valid credit card number
validate :: Integer -> Bool
validate n = helper n `mod` 10 == 0
  where
    helper = sumDigits . doubleEveryOther . toDigits

type Peg = String

type Move = (Peg, Peg)

-- | Solves Tower of Hanoi problem with three pegs
hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 1 source dest _ = [(source, dest)]
hanoi n source dest aux =
  hanoi (n - 1) source aux dest ++
  [(source, dest)] ++ hanoi (n - 1) aux dest source

-- | Solves Tower of Hanoi problem with four pegs
hanoi2 :: Integer -> Peg -> Peg -> Peg -> Peg -> [Move]
hanoi2 0 _ _ _ _ = []
hanoi2 1 source dest _ _ = [(source, dest)]
hanoi2 n source dest aux1 aux2 =
  hanoi2 (n - 2) source aux1 aux2 dest ++
  [(source, aux2)] ++
  [(source, dest)] ++ [(aux2, dest)] ++ hanoi2 (n - 2) aux1 dest source aux2

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
-- sumDigits [] = 0
-- sumDigits (x:xs) = x `mod` 10 + x `div` 10 + sumDigits xs
sumDigits :: [Integer] -> Integer
sumDigits = foldr helper 0 where
  helper x = (+) ((x `mod` 10) + (x `div` 10))

----------

{-
  Basic Types
-}

{-
  Machine-sized integers
-}
i :: Int
i = -78

{-
  Int ranges
-}
biggestInt, smallestInt :: Int
biggestInt = maxBound
smallestInt = minBound

{-
  Arbitrary-precision integers
-}
n :: Integer
n = 123455678123515178951720517501736012760173608173061

reallyBig :: Integer
reallyBig = 2^(2^(2^(2^2)))

numDigits :: Int
numDigits = length (show reallyBig)

-- overflow == smallestInt
overflow :: Int
overflow = maxBound + 1

{-
  Double-precision floating point
-}
d1, d2 :: Double
d1 = 4.53255
d2 = 6.2381e-4

f1 :: Float
f1 = 5.555

{-
  Booleans
-}
b1, b2 :: Bool
b1 = True
b2 = False

{-
  Unicode characters
-}
c1, c2, c3 :: Char
c1 = 'x'
c2 = 'Ø'
c3 = 'λ'

{-
  String are lists of characters with special syntax
  String == [Char]
-}
s :: String
s = "Hello, Haskell!"

----------

{-
  Arithmetic
-}
ex01 = 3 + 2
ex02 = 19 - 27
ex03 = 2.35 * 8.6
ex04 = 8.7 / 3.1
ex05 = mod 19 3
-- Infix
ex06 = 19 `mod` 3
ex07 = 7 ^ 222
-- Parentheses to avoid the negation sign parsed and subtraction
ex08 = (-3) * (-7)

{-
  This throws error
  Couldn't match expected type ‘Int’ with actual type ‘Integer’
  Haskell does not do implicit conversion
-}
-- badArith1 = i + n
{-
  In order to have it working we need to convert
  either to any other numeric type
-}
goodArith1 = fromIntegral i + n

{-
  Here, n :: Integer is becoming ::Int and because ::Int 
  can't hold big value this expression 
  is less than goodArith1
-}
goodArith2 = i + fromIntegral n

{-
  This also throws error
  No instance for (Fractional Int) arising from a use of ‘/’
  If we look at the type of "/" ((/) :: Fractional a => a -> a -> a)
  We can notice that it takes Fractional typeclass
  and 'i' is an ::Int
-}
-- badArith2 = i / i

{-
  For integer division we can use div
-}
ex09 = i `div` i
ex10 = 12 `div` 5

----------

{-
  Boolean logic
-}

ex11 = True && False
ex12 = not (False || True)

ex13 = 'a' == 'a'
-- Not equal
ex14 = 16 /= 3
ex15 = (5 > 3) && ('p' <= 'q')
-- Lexicographical order
ex16 = "Haskell" > "C++"

{-
  If expressions
  Notice that if-expressions are very different than if-statements. 
  For example, with an if-statement, the else part can be optional;
-}
ex17 = if 5 > 4 then "Cool" else "Not Cool"

{-
  Idiomatic Haskell does not use if expressions very much, 
  often using pattern-matching or guards instead
-}

----------

{-
  Defining basic functions
-}

-- Compute the sum of the integers from 1 to n
sumtorial :: Integer -> Integer
sumtorial 0 = 0
sumtorial n = n + sumtorial (n - 1)

-- Guards
hailstone :: Integer -> Integer
hailstone n
  | n `mod` 2 == 0 = n `div` 2
  | otherwise      = 3 * n + 1


{-
  foo (-3) == 0
  foo 0    == 16
  foo 1    == 3
  foo 36   == -43
  foo 38   == 41
-}
foo :: Integer -> Integer
foo 0 = 16
foo 1
  | "Haskell" > "C++" = 3
  | otherwise         = 4
foo n
  | n < 0             = 0
  | n `mod` 17 == 2   = -43
  | otherwise         = n + 3

isEven :: Integer -> Bool
isEven n
  | n `mod` 2 == 0 = True
  | otherwise      = False

----------

{-
  Pairs
-}
p :: (Int, Char)
p = (3, 'x')

{-
  Pair pattern matching
-}
sumPair :: (Int, Int) -> Int
sumPair (x, y) = x + y

----------

{-
  Using functions, and multiple arguments
-}

f :: Int -> Int -> Int -> Int
f x y z = x + y + z
ex18 = f 3 17 8

{-
  Function application has higher 
  precedence than any infix operators.
-}
ex19 = f 3 (i + 1) 7

----------

{-
  Lists
-}

nums, range, range2 :: [Integer]
nums   = [1, 2, 3, 19]
range  = [1..100]
range2 = [2, 4..100]

{-
  Strings are just list of characters
-}
hello1 :: [Char]
hello1 = ['h', 'e', 'l', 'l', 'o']

hello2 :: String
hello2 = "hello"

helloSame = hello1 == hello2

----------

{-
  Constructing lists
-}

emptyList = []

ex20 = 1 : []
ex21 = 3 : (1 : [])
ex22 = 2 : 3 : 4 : []

ex23 = [2, 3, 4] == 2 : 3 : 4 : []

-- Generate the sequence of hailstone iterations from a starting number
hailstoneSeq :: Integer -> [Integer]
hailstoneSeq 1 = [1]
hailstoneSeq n = n : hailstoneSeq (hailstone n)

----------

{-
  Functions on lists
-}

-- Compute the length of a list of Integers
intListLength :: [Integer] -> Integer
intListLength []     = 0
intListLength (_:xs) = 1 + intListLength xs

sumEveryTwo :: [Integer] -> [Integer]
sumEveryTwo []       = [] -- Do nothing to the empty list
sumEveryTwo [x]      = [x] -- Do nothing to lists with a single element
sumEveryTwo (x:y:zs) = (x + y) : sumEveryTwo zs

{-
  Combining functions
-}

-- The number of hailstone steps needed to reach 1 from a
-- starting number.
hailstoneLen :: Integer -> Integer
hailstoneLen n = intListLength  (hailstoneSeq n) - 1
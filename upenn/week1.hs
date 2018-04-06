import Data.List

toDigits :: Integer -> [Integer]
toDigits i = case i of
  0 -> []
  x -> toDigits (x `div` 10) ++ [x `mod` 10]

  -- 135 `div` 10 = 13
  -- 135 `mod` 10 = 5

toDigitsRev :: Integer -> [Integer]
toDigitsRev i = case i of
  0 -> []
  x -> x `mod` 10 : toDigitsRev (x `div` 10)

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther ints = case ints of
  [] -> []
  x : [] -> [x]
  (x : y : zs) -> x : (y + y) : doubleEveryOther zs

sumDigits :: [Integer] -> Integer
sumDigits ints = case ints of
  [] -> 0
  (h : t) -> h `div` 10 + h `mod` 10 + sumDigits t

-- Example: sumDigits [16,7,12,5] = 1 + 6 + 7 + 1 + 2 + 5 = 22

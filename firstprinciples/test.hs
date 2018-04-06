sayHello :: String -> IO ()
sayHello x = putStrLn("Hello, " ++ x ++ "!")

-- let x = 5; y = 6 in x * y
-- let can be rewritten as where
mult1    = x * y
 where x = 5
       y = 6

-- exercises chapter 2
-- 1. let x = 3; y = 1000 in x * 3 + y
ch2ex1   = x * 3 + y
 where x = 3
       y = 1000

-- 2. let y = 10; x = 10 * 5 + y in x * 5
ch2ex2   = x * 5
 where y = 10
       x = 10 * 5 + y

-- 3. let x = 7; y = negate x; z = y * 10 in z / x + y
ch2ex3   = z / x + y
 where x = 7
       y = negate x
       z = y * 10

triple x = x * 3

waxOn    = x * 5
 where z = 7
       y = z + 8
       x = y ^ 2

waxOff x = triple x

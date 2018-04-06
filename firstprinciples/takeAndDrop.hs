module  Reverse where

addBang :: [Char] -> [Char]
addBang x =  x ++ "!"

fifthChar :: [a] -> a
fifthChar x = x !! 4

dropNine :: [a] -> [a]
dropNine x = drop 9 x

thirdLetter :: String -> Char
thirdLetter x = x !! 2

letterIndex :: Int -> Char
letterIndex x = "Curry is awesome" !! x

rvrs1 x = (take 5 x) -- curry
rvrs2 x = (drop 6 (take 8 x)) -- is
rvrs3 x = drop 9 x -- awesome

rvrs :: String -> String
rvrs x = rvrs3 x ++ " " ++ rvrs2 x ++ " " ++ rvrs1 x
rvrs4 x = drop 9 x ++ " " ++ (drop 6 (take 8 x)) ++ " " ++ (take 5 x)

data Mood = Blah | Woot deriving Show

changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood    _ = Blah

main :: IO ()
main = print $ rvrs "Curry is awesome"

greetIfCool :: String -> IO ()
greetIfCool coolness =
  if cool
    then putStrLn "eyyyy. What's shakin'?"
  else
    putStrLn "pshhhhh."
  where cool = coolness == "downright frosty yo"

greetIfCool2 :: String -> IO ()
greetIfCool2 coolness =
  if cool coolness
    then putStrLn "eyyyy. What's shakin'?"
  else
    putStrLn "pshhhhh."
  where cool v = v == "downright frosty yo"

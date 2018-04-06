x :: Integer
x = 99

f :: Integer -> Integer
f r = r + 10

{- functions take one argument at any time
arrows are right associative ->
function application is left associative
ff :: Integer -> (Integer -> Integer)
:t ff x :: Integer -> Integer
:t ff x x :: Integer -}

ff :: Integer -> Integer -> Integer
ff a b = (a + b) * 2

fff :: Integer -> Integer -> Integer
fff = \a b -> (a + b) * 2

ffff = \a -> \b -> (a + b) * 2
fffff a = \b -> (a + b) * 2

-- polymorphism - generics - [T]
-- sortBananas :: List Bananas -> List Bananas
-- sortOranges :: List Oranges -> List Oranges
-- sortOranges :: List a -> list a

g :: p -> p
g x = x

h :: p1 -> p2 -> p1
h x y = x

--  Constructor is separated by |
-- Circle :: Integer -> Shape
data Shape =
  Circle Integer
  | Rectangle Integer Integer
  | Triangle Integer Integer Integer
  deriving (Eq, Show)

pie :: Integer
pie = 3

perimeter :: Shape -> Integer
perimeter = \s -> case s of
  Circle r -> r * 2 * pie
  Rectangle w h -> (w + h) * 2
  Triangle a b c -> a + b + c

-- :set -Wall (to turn on warnings)
perimeteragain :: Shape -> Integer
perimeteragain (Circle r) = r * 2 * pie
perimeteragain (Rectangle w h) = (w + h) * 2
perimeteragain (Triangle a b c) = a + b + c

-- can pass functions as arguments
-- \x -> perimeter (Rectangle 2 x) :: Integer -> Integer
hh :: (Integer -> Integer) -> Integer
hh w = 1 + w 88

-- Type classes
-- allows to write abstract functions
-- fat arrow => if they have an instance of that Type Class
-- sort :: Ord a => [a] -> [a]

class Equal a where
  (===) :: a -> a -> Bool

  -- instance TypeClass DataType where
  -- let a equal to Shape
  -- allows (===) to be implemented on Shape

{- instance Equal Shape where
  -- (===) :: Shape -> Shape -> Bool
  (===) s1 s2 =
    case s1 of
      Circle r1 -> case s2 of
                Circle r2 -> r1 == r2
                _ -> False
      _ -> False} -}

instance Equal Shape where
  -- (===) :: Shape -> Shape -> Bool
  (===) (Circle r1) (Circle r2) = r1 == r2
  (===) (Rectangle w1 _) (Rectangle w2 _) = w1 == w2
  (===) _ _ = False

-- type on left, Data Constructor on right
-- you can have data types with data variables
-- algebraic Data types
data ExactlyTwo a = ExactlyTwo a a
  deriving (Eq, Show)

mapOptional ::  (a -> b) -> Optional a  -> Optional b
map         ::  (a -> b) -> List     a  -> List     b
(.)         ::  (a -> b) -> (t ->    a) -> (t ->    b)
(.)         ::  (a -> b) -> ((->) t  a) -> ((->) t  b)

bindOptional :: (a -> Optional b) -> Optional a -> Optional b
flatMap      :: (a -> List     b) -> List     a -> List b

anon1 ::
  a
  -> List a
  -> List b

anon1 = \a x -> map (\_ -> a) x

anon2 ::
  a
  -> Optional a
  -> Optional b

anon2 = \a x -> mapOptional (\_ -> a) x

anon3 ::
  a
  -> (t -> b)
  -> (t -> a)
anon3 =
  \a x -> (.) (\_ -> a) x

(<$) ::
  Functor f =>
  a
  -> f b
  -> f a

(<$) = \a x -> (<$>) (\_ -> a) x

-- Functor (all things that have map[1])
-- Applicatives have two abstract functions - pure and apply <*>
-- All applicatives have an instance for Functor
-- Teaches applictives how to do function application
-- Bind is flatMap

-- "things that can bind and map can apply" (<*>)
-- "things that have bind and pure can apply" (<*>)
-- "things that have fmap" <$> - Functor
-- "things that habe pure" <*> - Applictive [Functors]
-- "things that have bind" (=<<)  - Monad
-- (=<<) :: (a -> f b) -> f a -> f b
-- (>>=) :: f a -> (a -> f b) -> f b

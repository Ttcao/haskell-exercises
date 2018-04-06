data Occupation = Occupation {
  oName :: String
} deriving Show

data User = User {
  uName :: String,
  maybeOcc :: Maybe Occupation
} deriving Show

getUser :: Int -> Maybe User
getUser x = Just (User "Bob" (Just (Occupation "Builder")))

getOccupation :: User -> Maybe Occupation
getOccupation user = maybeOcc user

getUserOccupationGivenUserId :: Int -> Maybe Occupation
--getUserOccupationGivenUserId n = getUser n >>= (\user -> getOccupation user)
getUserOccupationGivenUserId n = do
  user <- getUser n
  occupation <- getOccupation user
  return occupation

data Grade = Fail { val :: Int }  |
             Pass { val :: Int } |
             Distinction { val :: Int } deriving Show

getGrade :: Int -> Grade
getGrade x
  | x < 50 = Fail x
  | x < 80 = Pass x
  | otherwise = Distinction x

showGrade :: Grade -> String
showGrade (Fail x) = "Failed with " ++ show x
showGrade (Pass x) = "Passed with " ++ show x
showGrade (Distinction x) = "Distinction with " ++ show x

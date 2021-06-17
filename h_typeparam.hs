-- Type parameters examples

data Maybe a = Nothing | Just a
--'a' is the type parameter
--Maybe is a type constructor


--Old car type
--data Car = Car{ company :: String
-- , model :: String
-- , year :: Int
-- } deriving (Show)

 --Works for old car type
--tellCar :: Car -> String  
--tellCar (Car {company = c, model = m, year = y}) = "This " ++ c ++ " " ++ m ++ " was made in " ++ show y  

--new car type
data Car a b c = Car { company :: a
 ,model :: b
 ,year :: c
 } deriving (Show)


tellCar :: (Show a) => Car String String a -> String
tellCar (Car {company = c, model = m, year = y}) = "This " ++ c ++ " " ++ m ++ " was made in " ++ show y
 

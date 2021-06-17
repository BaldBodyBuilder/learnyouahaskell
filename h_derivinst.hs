-- Example of Derived Instances

data Person = Person { firstName :: String
 , lastName :: String
 , age :: Int
 }deriving (Eq, Show, Read)

--ENUM and Bounded work
 
data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
 deriving (Eq, Ord, Show, Read, Bounded, Enum)
 
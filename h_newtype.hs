-- dealing with zip lists:
{-
Round 1:data ZipList a = ZipList [a]
 -- one value constructor which has one field that is a list of things
Round 2: data ZipList a = ZipList { getZipList :: [a] }
 -- Record syntax so that we auto get a function that extracts a list from a ziplist
-}

-- The `newtype` keyword:
{-
used from taking one type and wrapping it in something else to present it as another type
data v newtype, newtype is faster because haskell knows you're just using it to wrap an existing type

newtype ZipList a  = ZipList { getZipList :: [a] }

Downsides:
when you make a new type from an existing type by using the newtype keyword you can only ahve one value constrcutor
that value constructor can only have one field  | With `data` you can make data types that have several value constructors 
	and each constructor can have 0+ fields

see:
data Profession = Fighter | Archer | Accountant  
  
data Race = Human | Elf | Orc | Goblin  
  
data PlayerCharacter = PlayerCharacter Race Profession  
-}

-- Newtype to make type class instances
{-

instance Functor Maybe where
fmap :: (a->b) -> Maybe a -> Maybe b


newtyping a tuple:
newtype Pair b a  = Pair {getPair :: (a,b)}

instance Functor (Pair c) where
 fmap f (Pair (x,y)) = Pair (f x , y)
 

-}
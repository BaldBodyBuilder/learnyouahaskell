-- Normal Binary Search Tree implementation / un balanced / 

data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show,Eq,Read)

--utility func for making a singleton tree
singleton :: a -> Tree a 
singleton x = Node x EmptyTree EmptyTree

--function for inserting an element into the tree
treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
 | x == a = Node x left right -- checks off that x is a because its an empty func
 | x < a = Node a ( treeInsert x left) right -- if the inserting tree is on the left side because smaller
 | x > a = Node a left (treeInsert x right)  -- Vice versa for large0r


--Checks if an element is in the tree
treeElem :: (Ord a) => a -> Tree a -> Bool  
treeElem x EmptyTree = False  
treeElem x (Node a left right)  
    | x == a = True  
    | x < a  = treeElem x left  
    | x > a  = treeElem x right   

-- Traffic Light
-- Defines the states of the traffic light
data TrafficLight = Red | Yellow | Green 
--Making an instance of EQ
--Instance is for making our types instances of typeclasses
instance Eq TrafficLight where
 Red == Red = True
 Green == Green = True
 Yellow == Yellow = True
 _ == _ = False

instance Show TrafficLight where
 show Red = "Red Light"
 show Yellow = " Yellow Light "
 show Green = " Green Light "

--We want all types of the form maybe making
-- to be part of the eq typeclass but only those types where the m is also part of the Eq
instance (Eq m) => Eq (Maybe m) where
 Just x == Just y = x == y
 Nothing == Nothing = True
 _ == _ = False


--data List a = Empty | Cons a (List a) deriving ( Show, Read, Eq, Ord)

-- Or in record syntax
-- data List a = Empty | Cons {listHead :: a, listTail :: List a } deriving (Show, Read, Eq, Ord)
--cons is another word for ':'
--4 `Cons` (5 `Cons` Empty) is like 4:(5:[]).

--Fixity is a mixture of either left or right associative binding and precedence 

infixr 5 :-:  
data List a = Empty | a :-: (List a) deriving (Show, Read, Eq, Ord)  

-- reminder 4+3 is (+) 4 3

-- For our custom list adding
infixr 5  .++  
(.++) :: List a -> List a -> List a   
Empty .++ ys = ys  
(x :-: xs) .++ ys = x :-: (xs .++ ys)  
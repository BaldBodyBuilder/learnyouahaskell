describeList :: [a] -> String  
describeList xs = "The list is " ++ what xs  
    where what [] = "empty."  
          what [x] = "a singleton list."  
          what xs = "a longer list." 

maximum' :: (Ord a) => [a] -> a
maximum' [] = error "Maximum of empty list" -- empty list	
maximum' [x] = x -- Singleton list
maximum' (x:xs)
 | x > maxTail = x
 | otherwise  = maxTail
 where maxTail = maximum' xs
 
 --alternatively
maximuma' :: (Ord a) => [a] -> a  
maximuma' [] = error "maximum of empty list"  
maximuma' [x] = x  
maximuma' (x:xs) = max x (maximuma' xs)  

--More recursion practice
-- 1) Replicate
replicate' :: (Num i, Ord i) => i->a->[a]
replicate' n x
 | n <=0 = []
 | otherwise = x:replicate'(n-1) x
 
-- 2) Take
take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
 | n <= 0 = [] --Returns an empty list of what was 
take' _ [] =[] --If we take from an empty list we get nothing!
take' n (x:xs) = x : take' (n-1) xs --actual taking, doesn't matter if n>length(list)

-- 3) Reverse
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

-- 4) Repeat
repeat' :: a -> [a]
repeat' x=x:repeat' x

-- 5) Elem
elem' :: (Eq a) => a -> [a] -> Bool
elem' a [] = False
elem' a (x:xs)
 | a == x = True
 | otherwise = a `elem'` xs
 
-- 6) QuickSort
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs)
 let smallerSorted = quicksort[a | a <- xs, a <=x]
     biggerSorted = quicksort[a | a <- xs, a > x]
 in smallerSorted ++ [x] ++ biggerSorted
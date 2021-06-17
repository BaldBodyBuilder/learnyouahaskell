compareWithHundred :: (Num a, Ord a) => a -> Ordering  
compareWithHundred = compare 100  

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipWidth' :: (a-> b -> c) -> [a] -> [b] -> [c]
zipWidth' _ [] _ = []
zipWidth' _ _ [] = []
zipWidth' f (x:xs) (y:ys) = f x y : zipWidth' f xs ys -- F is a function


flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
 where g x y = f y x

-- Modified quicksort
quicksort2 :: (Ord a) => [a] -> [a]    
quicksort2 [] = []    
quicksort2 (x:xs) =     
    let smallerSorted2 = quicksort2 (filter (<=x) xs)  --less than or greater than x compared to remaining tail
        biggerSorted2 = quicksort2 (filter (>x) xs)   
    in  smallerSorted2 ++ [x] ++ biggerSorted2  

-- Fields and Maps 
largestDivisible :: (Integral a) => a  
largestDivisible = head (filter p [100000,99999..])  
    where p x = x `mod` 3829 == 0  


chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n 
 | even n = n:chain (n `div` 2)
 | odd n = n:chain (n*3 + 1)
 

numLongChains :: Int
numLongChains = length (filter isLong (map chain [1..100]))
 where isLong xs = length xs > 15


-- Map practice
numLongChains2 :: Int
numLongChains2 = length (filter (\xs -> length xs > 15) (map chain [1..100]))

addThree' :: (Num a) => a -> a -> a-> a
addThree' = (\x y z -> x+y+z)
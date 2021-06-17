doubleMe x = x + x
doubleUs x y = x*2 +y*2
doubleUsTwo x y = doubleMe x + doubleMe y
doubleSmallNumber x = if x > 100
 then x
 else x*2
doubleSmallNumber' x = (if x > 100 then x else x*2) + 1
conanO'Brien = "Its a-me, Conan O'Brien!"
addThree :: Int -> Int -> Int -> Int
addThree x y z = x+y+z

lucky :: (Integral a) => a -> String
lucky 7 ="Lucky Number SEVEN!"
lucky x ="Sorry pal, you're out of luck"

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n-1)

addVectors :: (Num a) => (a,a) -> (a,a) -> (a,a)
addVectors (x1,y1) (x2,y2) = (x1+x2,y1+y2)

third :: (a,b,c) -> c
third (_,_,z) = z

head' :: [a]->a
head' [] = error "Can't find a head"
head' (x:_) = x

sum' :: (Num a) => [a] ->a
sum' []=0
sum' (x:xs) = x + sum' xs

myCompare :: (Ord a) => a-> a-> Ordering
a `myCompare` b
 | a>b  = GT
 | a==b = EQ
 | a<b  = LT
 
describeList :: [a] -> String  
describeList xs = "The list is " ++ case xs of [] -> "empty."
                                               [x] -> "a singleton list."   
                                               xs -> "a longer list." 
 
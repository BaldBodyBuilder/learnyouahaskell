sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 15 xs

--Written in a more short hand form

sum2' :: (Num a) => [a] -> a
sum2' = foldl (+) 0

-- Modified ELEM Check

elem' :: (Eq a) => a -> [a] -> Bool
elem' y ys = foldl (\acc x -> if x==y then True else acc) False ys

-- Fold right demonstration
map' :: (a -> b) -> [a] -> [b]
map' f xs = foldr (\x acc -> f x : acc) [] xs
--left fold version
--map' f xs = foldl(\acc x -> acc ++ [f x]) [] xs


--scan work
sqrtSums :: Int
sqrtSums = length (takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))) + 1


oddSquareSum :: Integer
oddSquareSum =
 let oddSquares = filter odd $ map (^2) [1..]
     belowLimit = takeWhile (<10000) oddSquares
 in sum belowLimit
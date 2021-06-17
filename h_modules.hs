import Data.List

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

--sorting a list before grouping it allows us to see how many unique elements there are
--map (\l@(x:xs) -> (x,length l)) . group . sort $ [1,1,1,1,2,2,2,2,4,5,6,6,6,7,7,8]
search :: (Eq a) => [a] -> [a] -> Bool
search needle haystack = 
 let nlen = length needle
 in foldl (\acc x -> if take nlen x == needle then True else acc) False(tails haystack)
 
phoneBook =   
    [("betty","555-2938")  
    ,("bonnie","452-2928")  
    ,("patsy","493-2928")  
    ,("lucille","205-2928")  
    ,("wendy","939-8282")  
    ,("penny","853-2492")  
    ]  

--Lookup a specific key
findKey :: (Eq k) => k-> [(k,v)] -> v
findKey key xs = snd . head . filter (\(k,v) -> key == k) $ xs
--Improved fix with a maybe data type
findKey' :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey' key [] = Nothing
findKey' key ((k,v):xs) = if key == k
 then Just v
 else findKey' key xs
 
 --findkey with a fold
 findKey'2 :: (Eq k) => k -> [(k,v)] -> Maybe v
 findKey'2 key = foldr (\(k,v) acc -> if key == k then Just v else acc) Nothing
 
 -- Custom fromList function
 fromList' :: (Ord l) => [(k,v)] -> Map.Map k v
 fromList' = foldr(\(k,v) acc -> Map.insert k v acc) Map.empty
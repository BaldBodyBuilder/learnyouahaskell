import Data.List  
  
main = do  
    contents <- getContents  
    let threes = groupsOf 3 (map read $ lines contents)  
        roadSystem = map (\[a,b,c] -> Section a b c) threes  
        path = optimalPath roadSystem  
        pathString = concat $ map (show . fst) path  
        pathPrice = sum $ map snd path  
    putStrLn $ "The best path to take is: " ++ pathString  
    putStrLn $ "The price is: " ++ show pathPrice


data Node = Node Road Road | EndNode Road
data Road = Road Int Node

-- Alternatively, using the 'Maybe' Functions

--data Node = Node Road (Maybe Road)
--data Road = Road Int Node


-- could've used a triple tuple but creating our own data types helps people understand more about the system.

data Section = Section {getA :: Int, getB :: Int, getC :: Int} deriving (Show)
type RoadSystem = [Section]

-- Representing our RoadSystem as:
heathrowToLondon :: RoadSystem
heathrowToLondon = [Section 50 10 30, Section 5 90 20, Section 40 2 25, Section 10 8 0]

-- Data type for shortest path should take a road system as a param and return a path

data Label = A | B | C deriving (Show)
type Path = [(Label, Int)] -- type synonym


roadStep :: (Path, Path) -> Section -> (Path, Path)  
roadStep (pathA, pathB) (Section a b c) =   
    let priceA = sum $ map snd pathA  
        priceB = sum $ map snd pathB  
        forwardPriceToA = priceA + a  -- only following on a
        crossPriceToA = priceB + b + c  -- crossing from B over C to A
        forwardPriceToB = priceB + b  -- Only following on B
        crossPriceToB = priceA + a + c  -- Crossing from A to B over C
        newPathToA = if forwardPriceToA <= crossPriceToA  -- If the price to stay on A is less than or equal to cross price then
                        then (A,a):pathA  -- Sticking on A
                        else (C,c):(B,b):pathB  -- Crossing over to B
        newPathToB = if forwardPriceToB <= crossPriceToB  -- If the price to stay on B is less than or equal to cross price then 
                        then (B,b):pathB  --Sticking on B
                        else (C,c):(A,a):pathA  --Crossing over to A
    in  (newPathToA, newPathToB)
-- (A,a):pathA is basically prepending something like ["B",50] to the pathing

optimalPath :: RoadSystem -> Path  
optimalPath roadSystem = 
    let (bestAPath, bestBPath) = foldl roadStep ([],[]) roadSystem  
    in  if sum (map snd bestAPath) <= sum (map snd bestBPath)  
            then reverse bestAPath  
            else reverse bestBPath

groupsOf :: Int -> [a] -> [[a]]
groupsOf 0 _ = undefined
groupsOf _ [] = []
groupsOf n xs = take n xs : groupsOf n (drop n xs)



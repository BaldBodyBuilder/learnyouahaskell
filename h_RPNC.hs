-- Solving a polish number calculator
{-

Starting with 
solveRPN :: (Num a) => String -> a
 -- we want a string a as parameter to produce a number as a result 
 will be using a 'foldl' and if we have a stack of 10,4,3 it will look like [3,4,10]
 
-}

-- words is the original list of inputs, [] is the new stack starting out empty 
{-
import Data.List

solveRPN :: (Num a) => String -> a
solveRPN expression  = head (foldl foldingFunction [] (words expression)) 
 where foldingFunction stack item = 
-}


--In point free style
{-
import Data.List  
  
solveRPN :: (Num a, Read a) => String -> a  
solveRPN = head . foldl foldingFunction [] . words  
    where   foldingFunction (x:y:ys) "*" = (x * y):ys  
            foldingFunction (x:y:ys) "+" = (x + y):ys  
            foldingFunction (x:y:ys) "-" = (y - x):ys  
            foldingFunction xs numberString = read numberString:xs

-}
-- In this example we use [3,4,9,3]
-- x = 3, y = 4. Returns a list of ys with only 1 element which is (x <expression> y) at the head of the list.
{-
[] and ["2"] then [2] ["3"] then [3,2] ["+"]
-}

-- Version 2 with more operators
import Data.List  

solveRPN :: String -> Float  
solveRPN = head . foldl foldingFunction [] . words  
    where   foldingFunction (x:y:ys) "*" = (x * y):ys  
            foldingFunction (x:y:ys) "+" = (x + y):ys  
            foldingFunction (x:y:ys) "-" = (y - x):ys  
            foldingFunction (x:y:ys) "/" = (y / x):ys  
            foldingFunction (x:y:ys) "^" = (y ** x):ys  -- ** is floatin point exponentiation
            foldingFunction (x:xs) "ln" = log x:xs  
            foldingFunction xs "sum" = [sum xs]  
            foldingFunction xs numberString = read numberString:xs


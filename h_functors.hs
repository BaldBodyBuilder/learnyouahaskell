-- Understanding functors

{-

instance Functor IO where
 fmap f action = do
  result <- action
  return (f result)

Were f mapping a function over a IO action `action` and we want to get back an I/O action that does the same 
thing but has the function applied voer its result value

We could also do
main = do line <- getLine
          let line' = reverse line
		  putStrLn $ "You said " ++ line' ++ " backwards!"
		  putStrLn $ "Yes, you really said" ++ line' ++ " backwards!"
=== Written using fmap ===
main = do line <- fmap reverse getLine  
          putStrLn $ "You said " ++ line ++ " backwards!"  
          putStrLn $ "Yes, you really said" ++ line ++ " backwards!" 
-}


--Using function composition to form multiple functions or apply multiple transformations to a single piece of data
{-

import Data.Char
import Data.List
Similar to 			   (\xs -> intersperse '-' (reverse (map toUpper xs)))
main = do line <- fmap (intersperse '-' . reverse . map toUpper) getLine
          putStrLn line
-- implemented in Control.Monad.Instances


-}

-- Monads
{-
instance Functor ((->) r) where  
    fmap f g = (\x -> f (g x))
vs

instance Functor (r ->) where  
    fmap f g = (\x -> f (g x)) 
-}

-- Dealing with fmap rules (Functor LAWS)
{-

instance Functor Maybe where
 fmap f (Just x) = Just (f x)
 fmap f Nothing = Nothing

-}
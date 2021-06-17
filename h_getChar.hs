{-
main = do
 c <- getChar
 if c /= ' '
  then do
   putChar c
   main
  else return ()
-}

{-
import Control.Monad

main = do 
 c <- getChar
 when (c /= ' ') $ do
  putChar c
  main
-}

--Without using a sequence:
{-
main = do
 a <- getLine
 b <- getLine
 c <- getLine
 print [a,b,c]
 -}
 {-
--Using a sequence
main = do
 rs <- sequence [getLine, getLine, getLine]
 print rs
-}

{-
-- Infinite runtime execution
import Control.Monad
import Data.Char

main = forever $ do
 putStr "Give me some input my guy"
 l <- getLine
 putStrLn $ map toUpper l
 
-}

-- Example of forM

import Control.Monad

main = do
 colors <- forM [1,2,3,4] (\a -> do
  putStrLn $ "Which color do you associate with the number " ++ show a ++ "?"
  color <- getLine
  return color)
 putStrLn "The colors that you associate with 1, 2, 3, and 4 are: "
 mapM_ putStrLn colors
 
 
 
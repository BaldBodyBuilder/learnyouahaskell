--Basically working caps lock program using cygwin
{-
import Data.Char  
  
main = do  
    contents <- getContents  
    putStr (map toUpper contents) 
-}
{-
main = do
 contents <- getContents
 putStr (shortLinesOnly contents)
 
shortLinesOnly :: String -> String
shortLinesOnly input = 
 let allLines = lines input
     shortLines = filter (\line -> length line < 10) allLines
     result = unlines shortLines
 in result
-}

--Alternate Version / Does the exact same thing but with less lines => less lazy
main = interact $ unlines. filter ((<10). length ). lines

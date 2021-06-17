{-
import System.IO

main = do
 handle <- openFile "girlfriend.txt" ReadMode
 contents <- hGetContents handle
 putStr contents
 hClose handle

-}
{-
Re-Written for 'withFile'
import System.IO

main = do
 withFile "girlfriend.txt" ReadMode (\handle -> do
  contents <- hGetContents handle
  putStr contents)


-}

{-
Example withFile function
withFile' :: FilePath -> IOMode -> (Handle -> IO a) -> IO a  
withFile' path mode f = do  
    handle <- openFile path mode   
    result <- f handle  
    hClose handle  
    return result 

-}

{-
Using read file instead of open file
import System.IO

main = do
 contents <- readFile "girlFriend.txt"
 putStr contents
-}
import System.IO
import Data.Char

main = do
 contents <- readFile "girlfriend.txt"
 writeFile "girlfriendcaps.txt" (map toUpper contents)


{-
Readinga file in 2048 bytes as an example

main = do   
    withFile "something.txt" ReadMode (\handle -> do  
        hSetBuffering handle $ BlockBuffering (Just 2048)  
        contents <- hGetContents handle  
        putStr contents) 

-}
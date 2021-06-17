import System.Environment  
import System.IO  
import System.IO.Error
import Control.Exception -- UPDATED  
  
main = toTry `catch` handler  
              
toTry :: IO ()  
toTry = do (fileName:_) <- getArgs  
           contents <- readFile fileName  
           putStrLn $ "The file has " ++ show (length (lines contents)) ++ " lines!"  


-- Updated handler error exceptions
handler :: IOError -> IO ()  
handler e  
    | isDoesNotExistError e = putStrLn "The file doesn't exist!"  
    | isFullError e = freeSomeSpace  
    | isIllegalOperation e = notifyCops  
    | otherwise = ioError e  
	
-- Method of performing multiple catch statements
{-
main = do toTry `catch` handler1
          thenTryThis `catch` handler2
		  launchRockets
-}
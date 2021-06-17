import System.IO
import System.Directory
import Data.List

main = do        
    handle <- openFile "todo.txt" ReadMode  
    (tempName, tempHandle) <- openTempFile "." "temp"  
    contents <- hGetContents handle  
    let todoTasks = lines contents -- todotasks becomes ["Iron the dishes", ......]     
        numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks -- Changes it to ["0 - Iron the dishes"..]     
    putStrLn "These are your TO-DO items:"  
    putStr $ unlines numberedTasks  
    putStrLn "Which one do you want to delete?"     
    numberString <- getLine     
    let number = read numberString     
        newTodoItems = delete (todoTasks !! number) todoTasks  -- !! returns an element from a list and delete_ deletes the first occurence of the element in a list.   
    hPutStr tempHandle $ unlines newTodoItems  
    hClose handle  
    hClose tempHandle  
    removeFile "todo.txt"  
    renameFile tempName "todo.txt"  
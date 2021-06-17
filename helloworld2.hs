import Data.Char

main = do
 putStrLn "Whats your first name"
 firstName <- getLine
 putStrLn "Whats your last name?"
 lastName <- getLine
 let bigFirstName = map toUpper firstName
     bigLastName = map toUpper lastName
 putStrLn $ "hey " ++ bigFirstName ++ " " ++ bigLastName ++ ", how are you?"
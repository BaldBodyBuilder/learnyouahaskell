phoneBook :: [(String,String)]  
phoneBook =      
    [("betty","555-2938")     
    ,("bonnie","452-2928")     
    ,("patsy","493-2928")     
    ,("lucille","205-2928")     
    ,("wendy","939-8282")     
    ,("penny","853-2492")     
    ]

--type phoneBook = [(String, String)]

type PhoneNumber = String
type Name = String
type PhoneBook = [(Name, PhoneNumber)]

-- Function for PhoneBook
--			   String -> String -> [(String, String)] -> Bool instead of phonebook
inPhoneBook :: Name -> PhoneNumber -> PhoneBook -> Bool
inPhoneBook name pnumber pbook = (name,pnumber) `elem` pbook  

import qualified Data.Map as Map
type IntMap = Map.Map Int

-- data Either a b = Left a | Right b deriving (Eq, Ord, Read, Show)

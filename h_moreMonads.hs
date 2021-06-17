-- Just 9 >>= (\x -> Just (x > 8))
{-
Converts to:
marySue :: Maybe Bool
marySue = do
 x <- Just 9
 Just (x >8)


-}

--Tightwalker routing
{-

routine :: Maybe Pole  
routine = do  
    start <- return (0,0)  
    first <- landLeft 2 start  
    second <- landRight 2 first  
    landLeft 1 second  

-}

--Pattern matching in a do expression:
{-

justH :: Maybe Char
justH = do
 (x:xs) <- Just "Hello"
  return x
-- evals to Just 'h'

-}

{-
Fail function in a do
fail :: (Monad m) => String -> m a
fail msg = error msg

--fail _ = Nothing -- Implementation for the Maybe

-}

--Designed to fail/crash:
wopwop :: Maybe Char
wopwop = do
 (x:xs) <- Just ""
 return x
-- Birds and the tight rope example
type Birds = Int
type Pole = (Birds,Birds)

landLeft :: Birds -> Pole -> Maybe Pole  
landLeft n (left,right)  
    | abs ((left + n) - right) < 4 = Just (left + n, right)  
    | otherwise                    = Nothing  
  
landRight :: Birds -> Pole -> Maybe Pole  
landRight n (left,right)  
    | abs (left - (right + n)) < 4 = Just (left, right + n)  
    | otherwise                    = Nothing  
x -: f = f x

banana :: Pole -> Maybe Pole  
banana _ = Nothing  

{-

Old functions: 
landLeft :: Birds -> Pole -> Pole  
landLeft n (left,right) = (left + n,right)  
  
landRight :: Birds -> Pole -> Pole  
landRight n (left,right) = (left,right + n)  

-}

{-
We're getting new poles wrapped in just statements
return (0,0) >>= landLeft 1 >>= landRight 4 >>= landLeft (-1) >>= landRight (-2)  
would fail at landleft -1


Why would this fail?
return (0,0) >>= landLeft 1 >>= landRight 4 >>= landLeft (-1) >>= landRight (-2)  
- > Nothing

0,0 1,0 1,4 0,4->Fails then a nothing and the final -2 can't touch a nothing
Couldnt have done this with a maybe because applicative functions don't allow for interaction between other applicative functions very well.

-}

-- If we hadn't used the maybe values within a failure context:
{-

routine :: Maybe Pole  
routine = case landLeft 1 (0,0) of  
    Nothing -> Nothing  
    Just pole1 -> case landRight 4 pole1 of   
        Nothing -> Nothing  
        Just pole2 -> case landLeft 2 pole2 of  
            Nothing -> Nothing  
            Just pole3 -> landLeft 1 pole3  

-}
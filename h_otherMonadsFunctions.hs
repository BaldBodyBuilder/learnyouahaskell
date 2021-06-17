--LiftM's implementation 
{-

liftM :: (Monad m) => (a -> b) -> m a -> m b
liftM f m = m >>= (\x -> return (f x))

v. do notation
liftM :: (Monad m) => (a->b) m a -> m b
liftM f m = do
 x <- m
 return (f x)
 

-}
--Reminder: (<*>) :: (Applicative f) => f(a -> b) -> f a -> f b

--In monad speak the ap function is basically the <*>
{-

ap :: (Monad m) => m (a -> b) -> m a -> m b
ap mf m = do 
 f <- mf -- monadic value who's result is a function. 
 x <- m
 return (f x)

-}
--LiftA2 a convience function defined as:
{-
liftA2 :: (Applicative f) => (a -> b -> c) -> f a -> f b -> f c
liftA2 f x y = f <$> x <*> y
-}

--Join's implementation
{-
join :: (Monad m) => m (m a) -> m a
join mm = do
 m <- mm
 m

-}
--filterM :: (Monad m) => (a -> m Bool) -> [a] -> m [a]
import Control.Monad.Writer
keepSmall :: Int -> Writer [String] Bool
keepSmall x
 | x < 4 = do
  tell ["Keeping " ++ show x]
  return True
 | otherwise = do
  tell [show x ++ " is too large, throwing it away"]
  return False

powerset :: [a] -> [[a]]
powerset xs = filterM (\x -> [True, False]) xs


--Reminder on fold and foldl
{-
foldl: (a -> b -> a) -> a -> [b] -> a
v. 
foldM :: (Monad m) => (a -> b-> m a) -> a -> [b] -> m a


-}

--using foldM
binSmalls :: Int -> Int -> Maybe Int  
binSmalls acc x  
    | x > 9     = Nothing  
    | otherwise = Just (acc + x)  
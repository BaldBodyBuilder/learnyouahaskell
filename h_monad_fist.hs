{-

Instead of using >>=, we'll call it applyMaybe
-}
applyMaybe :: Maybe a -> (a -> Maybe b) -> Maybe b
applyMaybe Nothing f = Nothing
applyMaybe (Just x) f = f x


{-
--Monad type class

class Monad m where -- Monad is a member of the applicative type class, fret not!
 return :: a -> m a -- same as 'pure' but with a different name type: (Monad m) => a -> m a, takes something and wraps it in a monad
 
 (>>=) :: m a -> (a -> m b) -> m b -- Bind: takes a monadic val and feeds it to a func that takes a normal value but returns a monadic value

 (>>) :: m a -> m b -> m b -- Hardly used
 x >> y = x >>= \_ -> y -- Never really used either
 
 fail :: String -> m a
 fail msg = error msg

-}

{-

Maybe is an instance of Monad

instance Monad Maybe where  
    return x = Just x  
    Nothing >>= f = Nothing  
    Just x >>= f  = f x  
    fail _ = Nothing  

-}
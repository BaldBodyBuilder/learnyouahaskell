--Instances of list monads
{-

instance Monad [] where
 return x = [x] -- useful for wrapping a single value into a list so it can interact nicely with them!
 xs >>= f = concat (map f xs)
 fail _ = []

-}

--Chaining values together non-deterministically
listOfTuples :: [(Int,Char)]
listOfTuples = do
 n <- [1,2]
 ch <- ['a','b']
 return (n,ch)
 
 --Defining the guard function
 {-
 
 guard :: (MonadPlus m) => Bool -> m ()
 guard True = return ()
 guard False = mzero
 
 
 -}
class Monad m => MonadPlus m where  
    mzero :: m a  
    mplus :: m a -> m a -> m a  

instance MonadPlus [] where  
    mzero = []  
    mplus = (++)  
 
 
guard :: (MonadPlus m) => Bool -> m ()
guard True = return ()
guard False = mzero
 
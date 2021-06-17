import System.Random
import Control.Monad.State

randomSt :: (RandomGen g, Random a) => State g a
randomSt = State randomSt

threeCoins :: State StdGen (Bool,Bool,Bool)
threeCoins = do
 a <- randomSt
 b <- randomSt
 c <- randomSt
 return (a,b,c)
 
{-
Takes an initial random generator and then passes it to the first randmSt
which produces a random number and a new generator
then it gets passsed to the next one, return with (a,b,c) because it doesn't change the generator

-}

--Either e a explained:
{-

instance (Error e) => Monad (Either e) where
 return x = Right x 
 Right x >>= f = f x
 Left err >>= f = Left err
 fail msg = Left (strMsg msg)
 
e type parameter must be indexed by the instance of the error type class, defines the Strmsg function
When a patten match fails in a do notation the left value is useed to signify this failure

-}
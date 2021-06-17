{-
We'll have to define the applicative functions; pure and <*>
-}
{-
class (Functor f) => Applicative f where
 pure :: a -> f a
 (<*>) :: f (a -> b) -> f a -> f b -}
{-
if we want to use a type constructor we must have it be a functor first (Which is why we can use Fmap on stuff)
for pure the 'f' is the applicative functor, pure will take a value of any type and return the f with a value inside it

for the <*> it reminds us of fmap: fmap :: (a -> b) -> f a -> f be
<*> takes a functor that has a function in it and another functor and sort of extracts that function from the first functior then maps it over the second one --> runs and extracts! / Sequence

-}

{- Applicative instance for ~maybe~ 
instance Applicative Maybe where
 pure = Just -- Remember pure just takes something and wraps it in the applicative function (Could also write as pure x = Just x)
 Nothing <*> _ = Nothing -- If we try to extract a function from a nothing the result is then nothing both params are funcs.
 (Just f) <*> something = fmap f something
-}
-- For the <*> if the left'_' is something it maps it over the right value, and if any value is nothing then the result is nothing.
-- Infix version of fmap defined as 
{-

(<$>) :: (Functor f) => (a-> b) -> f a -> f b
f <$> x = fmap f x

-}

-- Using lists which are applicative 
{-

instance Applicative [] where
 pure x = [x]
 fs <*> xs = [f x | f <- fs, x <- xs]

-}


{-
In chapter 2: [ x*y | x <- [2,5,10], y <- [8,10,11]]  
Now:           (*) <$> [2,5,10] <*> [8,10,11] -- the <$> calls the (*) between the two functions

-}
{-

IO is also a version of applicative
instance Applicative IO where
 pure = return
 a <*> b = do
  f <- a
  x <- b
  return (f x) -- in this case pure ==return

In terms of IO extracting is still in the game but now we also have sequencing
Because we're taking two IO actions and we're sequencing them/gluing them together 
We must exact the function from the 1st IO action but we must perform that action first.

-}

{-
myAction :: IO String
myAction = do a
 a <- getLine
 b <- getLine
 return $ a ++ b
 ----Now written in applicative below:
 myAction :: IO String
 myAction = (++) <$> getLine <*> getLine
 (So much simpler)

-}

main = do  
    a <- (++) <$> getLine <*> getLine  
    putStrLn $ "The two lines concatenated turn out to be: " ++ a  

{-
Another instance of Applicative functions is (->) r, so functions, rarely used aside from code golf
implemented applicatively:
instance Applicative ((->) r) where
 pure x = (\_ -> x)
 f <*> g = \x -> f x ( g x ) 
 --pure version looks like pure :: a -> ( r -> a)
-}
-- We can think of functions as boxes that contain their eventual results so doing something like:
-- k <$> f <*> g creates a function that will call K with the eventual results from f and g 
{-
When we do something like (+) <$> Just 3 <*> Just 5, we're using + on values that might or might not be there, 
which also results in a value that might or might not be there
-}
--Zip list is another instance of Applicative
{-
instance Applicative ZipList where
 pure x = ZipList (repeat x)
 ZipList fs <*> ZipList xs = ZipList (zipWith (\f x -> f x) fs xs)
 
-- The returning list will be as long as the shorter of the two lists
<*> applies the first function to the first value and 2nd function to the second value
pure returns a list of infinite repeating values
so pure "haha" is ZipList(["haha","haha" etc])
-}
-- transforms a list of appls into an appl with a list!
sequenceAA :: (Applicative f) => [f a] -> f [a]
sequenceAA [] = pure []
sequenceAA (x:xs) = (:) <$> x <*> sequenceAA xs

{-
// How sequence works on lists \\ 

We start off with sequenceA [[1,2],[3,4]]
That evaluates to (:) <$> [1,2] <*> sequenceA [[3,4]]
Evaluating the inner sequenceA further, we get (:) <$> [1,2] <*> ((:) <$> [3,4] <*> sequenceA [])
We've reached the edge condition, so this is now (:) <$> [1,2] <*> ((:) <$> [3,4] <*> [[]])
Now, we evaluate the (:) <$> [3,4] <*> [[]] part, which will use : with every possible value in the left list 
	(possible values are 3 and 4) with every possible value on the right list (only possible value is []), 
	which results in [3:[], 4:[]], which is [[3],[4]]. So now we have (:) <$> [1,2] <*> [[3],[4]]
Now, : is used with every possible value from the left list (1 and 2) 
	with every possible value in the right list ([3] and [4]), which results in [1:[3], 1:[4], 2:[3], 2:[4]], 
	which is [[1,3],[1,4],[2,3],[2,4]

sequenceAA [] == [[]]



-}



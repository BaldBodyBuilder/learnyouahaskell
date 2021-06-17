{-

class Monoid m where  
    mempty :: m  --not really a function so its a polymorphic constant, the identity value for a particular monoid
    mappend :: m -> m -> m  --being a binary function and taking two monoid values and returning a third
    mconcat :: [m] -> m  --list of monoid values and reduces to a single value by doing mappend btwn list elements
    mconcat = foldr mappend mempty  
Monoid laws!

mempty `mappend` x = x
x `mappend` mempty = x
(x `mappend` y) `mappend` z = x `mappend` (y `mappend` z)


-}

--Lists are monoids!
{-

instance Monoid [a] where
 mempty = []
 mappend = (++)


"Notice that we wrote instance Monoid [a] and not instance Monoid [],
	because Monoid requires a concrete type for an instance"
-}

-- Data.Monoid
{-

Exports Product and Sum

newtype Product a =  Product { getProduct :: a }  
    deriving (Eq, Ord, Read, Show, Bounded)  
	
instance Num a => Monoid (Product a) where  
    mempty = Product 1  
    Product x `mappend` Product y = Product (x * y)  

-}
--Comparing two strings using monoids
{-

import Data.Monoid  
  
lengthCompare :: String -> String -> Ordering  
lengthCompare x y = (length x `compare` length y) `mappend`  
                    (vowels x `compare` vowels y) `mappend`  
                    (x `compare` y)  
    where vowels = length . filter (`elem` "aeiou")  

-}
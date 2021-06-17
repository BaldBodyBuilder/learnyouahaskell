class YesNo a where
 yesno :: a-> Bool

instance YesNo Int where
 yesno 0 = False
 yesno _ = True
 
instance YesNo [a] where
 yesno [] = False
 yesno _ = True
 
instance YesNo Bool where 
 yesno = id -- takes the parameter and returns the same thing

instance YesNo (Maybe a) where 
 yesno (Just _) = True
 yesno Nothing = False 
 
-- mimicing the if statement with yes and no values
yesnoIf :: (YesNo y) => y -> a -> a -> a
yesnoIf yesnoVal yesResult noResult = if yesno yesnoVal then yesResult else noResult
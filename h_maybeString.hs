{-
foo :: Maybe String
foo = Just 3   >>= (\x ->
      Just "!" >>= (\y ->
	  Just (Show x ++ y)))
-}
-- VERSUS

foo :: Maybe String
foo = do
 x <- Just 3 -- Using the left facing arrow treats x and y like string vaules and binds the 3 and ! to them
 y <- Just "!"
 Just (show x ++ y)
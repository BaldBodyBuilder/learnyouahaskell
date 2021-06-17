-- 3D vector type and some operations
data Vector a = Vector a a a deriving (Show)
-- Placing the Num t here is fine but placing it on the next line is type constraining
-- and would make everything more difficult by having to declare types in the functions
vplus :: (Num t) => Vector t -> Vector t -> Vector t
(Vector i j k) `vplus` (Vector l m n) =Vector (i+l) (j+m) (k+n)

vectMult :: (Num t) => Vector t -> t -> Vector t  
(Vector i j k) `vectMult` m = Vector (i*m) (j*m) (k*m)  
 --[Type constructor ] ---[ Value constructors ^\/ ] 
scalarMult :: (Num t) => Vector t -> Vector t -> t  
(Vector i j k) `scalarMult` (Vector l m n) = i*l + j*m + k*n  

-- function names are infixed to show that you're combining both vectors

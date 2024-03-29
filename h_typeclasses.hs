-- Type classes and custom variables

module Shapes   
( Point(..)  
, Shape(..)  
, surface  
, nudge  
, baseCircle  
, baseRect  
) where

-- data bool = False | True

--data Shape = Circle Float Float Float | Rectangle Float Float Float Float

--surface :: Shape -> Float
--surface (Circle _ _ r) = pi * r ^ 2
--surface (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)


-- Modified Shape to show as a string
--data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show)

-- Intermediate data type
data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)

surface :: Shape -> Float
surface (Circle _ r) = pi * r ^ 2
surface (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1)* (abs $ y2 - y1)

--Function to nudge a shape in a certain direction along the x y axis
nudge :: Shape -> Float -> Float -> Shape
nudge (Circle (Point x y) r) a b = Circle (Point (x+a) (y+b)) r
nudge (Rectangle (Point x1 y1) (Point x2 y2)) a b = Rectangle (Point (x1+a) (y1+b)) (Point (x2+a) (y2+b))

-- Functions to create shapes of some size at the (0,0) and then nudge 'em
baseCircle :: Float -> Shape
baseCircle r = Circle (Point 0 0) r

baseRect :: Float-> Float -> Shape
baseRect width height = Rectangle ( Point 0 0 ) (Point width height)


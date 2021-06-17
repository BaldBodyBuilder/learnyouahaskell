--type Stack  = [Int]
{-
pop :: Stack -> (Int,Stack)
pop (x:xs) = (x,xs)

push :: Int -> Stack -> ((),Stack)
push a xs = ((), a:xs)

--Simulation
stackManip :: Stack -> (Int, Stack)
stackManip stack = let
 ((),newStack1) = push 3 stack
 (a, newStack2) = pop newStack1
 in pop newStack2
-}
{-
We would prefer something less tedious, like:
stackManip = do
 push 3
 a <- pop
 pop


-}
--The State Monad
{-

newType State s a = State {runState :: s -> (a,s) }

instance Monad (State s) where
 return x = State $ \s -> (x,s) -- aim is to take a value and make a stateful computation that always has that value as its result
 (State h) >>= f = State $ \s -> let (a,newState) = h s
                                     (State g) = f a
							     in g newState -- result is a tuple of the final result and final state


-}
--Wrapping pop and push in state computations

import Control.Monad.State  
 
type Stack = [Int]

pop :: state Stack Int  
pop = state $ \(x:xs) -> (x,xs)  
  
push :: Int -> state Stack ()  
push a = state $ \xs -> ((),a:xs) 

stackManip :: state Stack Int  
stackManip = do  
    push 3  
    a <- pop  
    pop  
module Expression where

-- Cases for a type
data Shape = Circle { radius :: Double }
           | Square { side :: Double }

-- Operation on the type shape
area :: Shape -> Double
area (Circle r) = 3.14 * r * r
area (Square s) = s * s

-- Adding a new function does not require changing any old code

perimiter :: Shape -> Double
perimiter (Circle r) = 2 * 3.14 * r
perimiter (Square s) = s * 4

-- The bad part is that if we ever have to add a new shape we need to update all our old functions

{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances #-}

module Ch11 where

-- newtype can have only a single unary constructor
-- newtype has no runtime overhead; it reuses the representation of the type it contains
-- the difference between newtype and its type is gone after compilation
-- with newtype, we can define different typeclasses, as the original type

data Price = Price Integer deriving (Eq, Show)
data Size = Size Integer deriving (Eq, Show)

data Manufacturer = Mini | Mazda | Tata deriving (Eq, Show)

data Airline = PapuAir | CataputsR'Us | TakeYourChancesUnited deriving (Eq, Show)

data Vehicle = Car Manufacturer Price
             | Plane Airline Size
             deriving (Eq, Show)

myCar :: Vehicle
myCar = Car Mini (Price 14000)

urCar :: Vehicle
urCar = Car Mazda (Price 20000)

clownCar :: Vehicle
clownCar = Car Tata (Price 7000)

doge :: Vehicle
doge = Plane PapuAir (Size 50)

isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar _ = False

isPlane :: Vehicle -> Bool
isPlane (Plane _ _) = True
isPlane _ = False

areCars :: [Vehicle] -> [Bool]
areCars = map isCar

getManu :: Vehicle -> Manufacturer
getManu (Car manu _) = manu
getManu _ = Mini

newtype Goats = Goats Int deriving (Eq, Show)
newtype Cows  = Cows Int  deriving (Eq, Show)

class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 42


newtype Cats =
  Cats Int deriving (Eq, Show, Num)

instance TooMany Cats where
  tooMany (Cats n) = n > 5

instance TooMany (Int, String) where
  tooMany (n, _) = n > 10

-- instance TooMany (Int, Int) where
  -- tooMany (x, y) = x + y > 11

instance (Num a, TooMany a) => TooMany (a, a) where
  tooMany (x, y) = tooMany (x + y)
--
-- tooManyGoats :: Int -> Bool
-- tooManyGoats n = n > 5

tooManyGoats :: Goats -> Bool
tooManyGoats (Goats n) = n > 5

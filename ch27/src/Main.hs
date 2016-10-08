{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE InstanceSigs #-}

module Main where

import Control.Monad
import Control.Applicative

data Test
  = A Test2
  | B Test2
  deriving (Show)

data Test2
  = C Int
  | D Int
  deriving (Show)

forceNothing :: Test -> Int
forceNothing _ = 0

forceTest :: Test -> Int
forceTest (A _) = 1
forceTest (B _) = 2

forceTest2 :: Test -> Int
forceTest2 (A (C i)) = i
forceTest2 (A (D i)) = i
forceTest2 (B (C i)) = i
forceTest2 (B (D i)) = i

main :: IO ()
main = do
  return ()

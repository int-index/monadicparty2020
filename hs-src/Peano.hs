{-# LANGUAGE GADTSyntax #-}
{-# LANGUAGE StandaloneDeriving #-}

module Peano where

import Numeric.Natural (Natural)

data N where
  Z :: N
  S :: N -> N

deriving instance Show N

fromNatural :: Natural -> N
fromNatural n =
  if n == 0
  then Z
  else S (fromNatural (n - 1))

toNatural :: N -> Natural
toNatural Z = 0
toNatural (S n) = 1 + toNatural n

add :: N -> N -> N
add Z m = m
add (S n) m = S (add n m)

mul :: N -> N -> N
mul Z _ = Z
mul (S n) m = add m (mul n m)

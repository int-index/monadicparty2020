{-# LANGUAGE GADTSyntax #-}

module Peano where

data N where
  Z :: N
  S :: N -> N

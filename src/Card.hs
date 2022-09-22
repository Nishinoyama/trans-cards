module Card
  ( Card(..),
    cardStats,
  ) where

import BasisStats
import Attribute


data Card = BasisCard { stats :: BasisStats
                      , attributes :: Attributes
                      } deriving (Show)

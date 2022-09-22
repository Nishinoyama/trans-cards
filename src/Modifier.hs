module Modifier
  ( Modifier,
    modifyAttribute,
    modifyStats,
  ) where

import Card
import BasisStats
import Attribute

type Modifier = Card -> Card

modifyAttribute :: (Attributes -> Attributes) -> Modifier
modifyAttribute f c = c { attributes = f $ attributes c }

modifyStats :: (BasisStats ->  BasisStats) -> Modifier
modifyStats s c = c { stats = s $ stats c }

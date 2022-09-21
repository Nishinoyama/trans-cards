module Modifier(
  giveAttribute,
  addStats
  ) where

import Card
import Attribute

giveAttribute :: Attribute -> Card -> Card
giveAttribute a c = BasisCard { stats = stats c, attributes = a : attributes c }

addStats :: (CardStats ->  CardStats) -> Card -> Card
addStats s c = BasisCard { stats = s $ stats c, attributes = attributes c }

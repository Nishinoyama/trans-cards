module Card(
  Card(..),
  CardStats(..),
  cardStats,
  addHp,
  addAtk,
  addDef,
  addSpa,
  addSpd,
) where

import Attribute

data CardStats = CardStats { hp :: Int, atk :: Int, def :: Int, spa :: Int, spd :: Int} deriving (Show, Eq)
cardStats :: (Int, Int, Int, Int, Int) -> CardStats
cardStats (h, a, b, c, d) = CardStats { hp = h, atk = a, def = b, spa = c, spd = d }
cardAdd :: CardStats -> CardStats -> CardStats
cardAdd c d = CardStats { hp = hp c + hp d, atk = atk c + atk d, def = def c + def d, spa = spa c + spa d, spd = spd c + spd d}
addHp :: Int -> CardStats -> CardStats
addHp a = cardAdd $ cardStats (a, 0, 0, 0, 0)
addAtk :: Int -> CardStats -> CardStats
addAtk a = cardAdd $ cardStats (0, a, 0, 0, 0)
addDef :: Int -> CardStats -> CardStats
addDef a = cardAdd $ cardStats (0, 0, a, 0, 0)
addSpa :: Int -> CardStats -> CardStats
addSpa a = cardAdd $ cardStats (0, 0, 0, a, 0)
addSpd :: Int -> CardStats -> CardStats
addSpd a = cardAdd $ cardStats (0, 0, 0, 0, a)

data Card = BasisCard { stats :: CardStats
                      , attributes :: [Attribute]
                      } deriving (Show)

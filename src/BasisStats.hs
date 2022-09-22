module BasisStats
  ( BasisStat(..),
    BasisStats,
    cardStats,
    resetStats,
    updateStat,
    setStat,
    addStat,
    mulStat,
  ) where

import Control.Lens (element, (.~), (&))

type StatType = Integer
data BasisStat = Hp | Atk | Def | Spa | Spd deriving (Eq, Enum, Show)
type BasisStats = [StatType]
cardStats :: (StatType, Integer, Integer, Integer, Integer) -> BasisStats
cardStats (h, a, b, c, d) = [h, a, b, c, d]
resetStats :: BasisStats -> BasisStats -> BasisStats
resetStats c _ = c
getStat :: BasisStat -> BasisStats -> StatType
getStat s c = c !! fromEnum s
setStat :: BasisStat -> StatType -> BasisStats -> BasisStats
setStat s a c = c & element (fromEnum s) .~ a
updateStat :: BasisStat -> (StatType -> Integer) -> BasisStats -> BasisStats
updateStat s f c = setStat s (f $ getStat s c) c
addStat :: BasisStat -> StatType -> BasisStats -> BasisStats
addStat s a = updateStat s (+a)
mulStat :: BasisStat -> StatType -> BasisStats -> BasisStats
mulStat s a = updateStat s (*a)

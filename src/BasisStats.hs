module BasisStats
  ( BasisStat(..),
    BasisStats,
    resetStats,
    updateStat,
    getStat,
    setStat,
    addStat,
    mulStat,
  ) where

import Control.Lens (element, (.~), (&))

type StatType = Integer
data BasisStat = Hp | Atk | Def | Spa | Spd deriving (Eq, Enum, Show)
type BasisStats = (StatType, StatType, StatType, StatType, StatType)
basisStatsList :: BasisStats -> [StatType]
basisStatsList (h, a, b, c, d) = [h, a, b, c, d]
resetStats :: BasisStats -> BasisStats -> BasisStats
resetStats c _ = c
getStat :: BasisStat -> BasisStats -> StatType
getStat s c = basisStatsList c !! fromEnum s
setStat :: BasisStat -> StatType -> BasisStats -> BasisStats
setStat s v stats = (h, a, b, c, d)
  where [h, a, b, c, d] = basisStatsList stats & element (fromEnum s) .~ v
updateStat :: BasisStat -> (StatType -> StatType) -> BasisStats -> BasisStats
updateStat s f c = setStat s (f $ getStat s c) c
addStat :: BasisStat -> StatType -> BasisStats -> BasisStats
addStat s a = updateStat s (+a)
mulStat :: BasisStat -> StatType -> BasisStats -> BasisStats
mulStat s a = updateStat s (*a)

module Main (main) where

import BasisStats
import Card
import Attribute
import Modifier
import qualified Data.Map as M

greedModifier :: Modifier
greedModifier = modifyStats (\(h, a, b, c, d) -> (h, a, d, c, b))
 . modifyStats (updateStat Def (`div` 2))
 . modifyStats (setStat Def 100)
 . modifyStats (addStat Atk 3)
 . modifyAttribute (updateAttribute Plant (+5))
 . modifyAttribute (setAttribute Blaze 5)
 . modifyStats (mulStat Spa 20)
 . modifyStats (setStat Hp 6)

main :: IO ()
main = do
  let
    card = BasisCard {
      stats = (1, 1, 1, 1, 1), attributes = M.fromList [(Aqua, 10)]
    }
  print card
  print $ greedModifier card
  print $ foldr1 (.) (replicate 200 greedModifier) card

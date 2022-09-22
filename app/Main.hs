module Main (main) where

import BasisStats
import Card
import Attribute
import Modifier
import qualified Data.Map as M

main :: IO ()
main = do
  let
    card = BasisCard {
      stats = cardStats (1, 1, 1, 1, 1), attributes = M.fromList [(Aqua, 10)]
    }
    giveBlazeAndAddAtk3 =
     modifyStats (updateStat Def (`div` 2))
     . modifyStats (setStat Def 100)
     . modifyStats (addStat Atk 3)
     . modifyAttribute (updateAttribute Plant (+5))
     . modifyAttribute (setAttribute Blaze 5)
     . modifyStats (mulStat Spa 20)
     . modifyStats (setStat Hp 6)
  print card
  print $ giveBlazeAndAddAtk3 card
  print $ foldr1 (.) (replicate 200 giveBlazeAndAddAtk3) card

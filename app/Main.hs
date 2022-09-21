module Main (main) where

import Card
import Attribute
import Modifier

main :: IO ()
main = do
  let
    card = BasisCard {
      stats = cardStats (30, 20, 30, 20, 30), attributes = [Aqua]
    }
    giveBlazeAndAddAtk3 = addStats (addAtk 3) . giveAttribute Blaze
  print card
  print $ giveBlazeAndAddAtk3 card

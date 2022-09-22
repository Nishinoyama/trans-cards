module Attribute
  ( Attributes,
    Attribute(..),
    getAttribute,
    memberAttribute,
    setAttribute,
    removeAttribute,
    genericUpdateAttribute,
    updateAttribute,
  ) where

import qualified Data.Map as M
import Data.Maybe

type Attributes = M.Map Attribute Integer
data Attribute = Aqua | Blaze | Plant deriving(Show, Eq, Ord)

getAttribute :: Attribute -> Attributes -> Integer
getAttribute a as = fromMaybe 0 (M.lookup a as)

memberAttribute :: Attribute -> Attributes -> Bool
memberAttribute a as = getAttribute a as /= 0

setAttribute :: Attribute -> Integer -> Attributes -> Attributes
setAttribute = M.insert

removeAttribute :: Attribute -> Attributes -> Attributes
removeAttribute = M.delete

genericUpdateAttribute :: Attribute -> (Integer -> Maybe Integer) -> Attributes -> Attributes
genericUpdateAttribute a f as = M.update f a $ setAttribute a (getAttribute a as) as

updateAttribute :: Attribute -> (Integer -> Integer) -> Attributes -> Attributes
updateAttribute a f as = setAttribute a (f $ getAttribute a as) as

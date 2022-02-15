module Docs.Tidal.MakeAndS.EWFLHR where

import Prelude

import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Tidal (make, s)
import WAGS.Lib.Tidal.Types (AFuture)

wag :: AFuture
wag = make 1.0
  { earth: s "notes:0"
  , wind: s "[~ notes:1 ~] ~"
  , fire: s "[~ ~ notes:2] ~"
  , lambert: s "~ notes:3"
  , hendricks: s "~ [~ notes:4 ~]"
  , ross: s "~ [~ ~ notes:5]"
  }

main :: Player
main = player $ tdl $ wag
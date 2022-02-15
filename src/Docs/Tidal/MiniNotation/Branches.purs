module Docs.Tidal.MiniNotation.Branches where

import Prelude

import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Tidal (make, s)
import WAGS.Lib.Tidal.Types (AFuture)

wag :: AFuture
wag =
  make 0.35
    { earth: s "<notes:0 notes:1> <notes:2 notes:3>"
    }

main :: Player
main = player $ tdl $ wag
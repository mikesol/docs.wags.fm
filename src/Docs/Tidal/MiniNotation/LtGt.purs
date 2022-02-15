module Docs.Tidal.MiniNotation.LtGt where

import Prelude

import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Tidal (make, s)
import WAGS.Lib.Tidal.Types (AFuture)

wag :: AFuture
wag =
  make 0.95
    { earth: s "bd [hh bd:6] [<hh:3 psr:3>, hh] hh"
    }

main :: Player
main = player $ tdl $ wag
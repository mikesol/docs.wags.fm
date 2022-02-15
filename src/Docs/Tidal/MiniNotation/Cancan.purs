module Docs.Tidal.MiniNotation.Cancan where

import Prelude

import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Tidal (make, s)
import WAGS.Lib.Tidal.Types (AFuture)

wag :: AFuture
wag =
  make 1.8
    { earth: s
        $ "can:3 ~ can:1 can ~ can ~ can:4 ~ can ~ can:1 can ~ can ~"
    }

main :: Player
main = player $ tdl $ wag
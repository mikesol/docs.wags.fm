module Docs.Tidal.MiniNotation.Symbol where

import Prelude

import Type.Proxy (Proxy(..))
import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Tidal (make, s)
import WAGS.Lib.Tidal.Types (AFuture)

wag :: AFuture
wag =
  make 0.96
    { earth: s "notes:3 notes:4"
    , wind: s (Proxy :: _ "hh:0 glitch:0")
    }

main :: Player
main = player $ tdl $ wag
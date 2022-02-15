module Docs.Tidal.MiniNotation.Square where

import Prelude

import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Tidal (make, s)
import WAGS.Lib.Tidal.Types (AFuture)

wag :: AFuture
wag =
  make 1.67
    { earth: s
        """amencutup:0 amencutup:1
        amencutup:2 [amencutup:3 amencutup:4]
        [amencutup:5 amencutup:6] [amencutup:7 amencutup:8]
        amencutup:9 amencutup:10"""
    }

main :: Player
main = player $ tdl $ wag
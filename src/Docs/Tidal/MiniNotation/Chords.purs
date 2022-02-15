module Docs.Tidal.MiniNotation.Chords where

import Prelude

import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Tidal (make, s)
import WAGS.Lib.Tidal.Types (AFuture)

wag :: AFuture
wag =
  make 0.9
    { earth: s """[notes:0, notes:3, notes:6]
    [notes:10 , notes:12 ,notes:14]"""
    }

main :: Player
main = player $ tdl $ wag
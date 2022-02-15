module Docs.Tidal.MakeAndS.Drones where

import Prelude

import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Tidal (drone, make)
import WAGS.Lib.Tidal.Types (AFuture)

wag :: AFuture
wag = make 1.0
  { water: drone "pad:0"
  , heart: drone "breaks125:0"
  }

main :: Player
main = player $ tdl $ wag
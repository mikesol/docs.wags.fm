module Docs.Tidal.MakeAndS.Duration where

import Prelude

import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Tidal (make, s)
import WAGS.Lib.Tidal.Types (AFuture)

fast = 0.2
medium = 0.5
slow = 1.0
reallySlow = 1000.0

wag :: AFuture
wag = make fast { earth: s "hh" }

main :: Player
main = player $ tdl $ wag
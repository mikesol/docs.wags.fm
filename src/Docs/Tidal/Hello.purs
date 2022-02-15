module Docs.Tidal.Hello where

import Prelude

import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Tidal (make, s)
import WAGS.Lib.Tidal.Types (AFuture)

wag :: AFuture
wag =  make 1.0 { earth: s "alphabet:0"}

main :: Player
main = player $ tdl $ wag
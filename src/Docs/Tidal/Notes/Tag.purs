module Docs.Tidal.Notes.Tag where

import Prelude

import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Tidal
  (changeRate, make, onTag, parse, s)
import WAGS.Lib.Tidal.Types (AFuture)

wag :: AFuture
wag = make 2.0
  { earth: s
      $ onTag "t0" (changeRate (const 1.5))
      $ onTag "t1" (changeRate (const 2.0))
      $ onTag "t2" (changeRate (const 0.8))
      $ parse "bd;t0 bd;t1 hh;t0 gretsch:3;t2"
  }

main :: Player
main = player $ tdl $ wag
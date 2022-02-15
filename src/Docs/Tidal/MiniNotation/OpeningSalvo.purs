module Docs.Tidal.MiniNotation.OpeningSalvo where

import Prelude

import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Tidal (make, s)
import WAGS.Lib.Tidal.Types (AFuture)

wag :: AFuture
wag =
  make 0.96
    { earth: s """<
  [psr:3 bd [notes:2,hh*2] [notes:3,chin*4]]
  [bd bd [notes:4,hh*2] [notes:5,chin*4]]
  [psr:3 bd [notes:6,hh*2] [notes:7,chin*4]]
  [bd bd [notes:8,hh*2] [notes:9,chin*4]]
  [[psr:3 psr:3] bd [notes:2,hh*2] [notes:3,chin*4]]
  [bd bd [notes:8,hh*2] [notes:9,chin*4]]
  [psr:3 bd [notes:9,hh*2] [notes:8,chin*4]]
  [bd bd [notes:10,hh*2] [notes:6,chin*4]]
  [psr:3 bd [notes:9,hh*2] [notes:7,chin*4]]
  [psr:3 bd [notes:10,hh*2] [notes:7,chin*4]]
  [psr:3 bd [notes:12,hh*2] [notes:7,chin*4]]
  [psr:3 bd [notes:14,hh*2] [notes:7,chin*4]]
  [psr:3 bd psr:3 [notes:7,chin*4]]
  [psr:3 bd psr:3 [notes:7,chin*4]]
  [psr:3 [psr:3,bd] [psr:3,notes:7] [psr:3,bd]]
  [[psr:3,notes:0] [psr:3,bd,notes:1] [psr:3,bd,[notes:6 notes:3]] [psr:3,bd,[notes:2 notes:0]]]
>"""
    }

main :: Player
main = player $ tdl $ wag
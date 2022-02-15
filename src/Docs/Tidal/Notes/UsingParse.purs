module Docs.Tidal.Notes.UsingParse where

import Prelude

import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Tidal (make, parse, s)
import WAGS.Lib.Tidal.Types (AFuture)

wag :: AFuture
wag = make 4.0
  { earth: s "crow:0 crow:1"
  , wind: s $ parse "baa:0 baa:1"
  }

main :: Player
main = player $ tdl $ wag
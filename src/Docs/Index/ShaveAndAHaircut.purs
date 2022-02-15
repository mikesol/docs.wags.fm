module Docs.Index.ShaveAndAHaircut where

import Prelude

import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Cycle (flatten, reverse)
import WAGS.Lib.Tidal.Synth (triangleSynth)
import WAGS.Lib.Tidal.Tidal
  (b, changeVolume, i, make, parse, s, x)
import WAGS.Lib.Tidal.Types (AFuture)

p = parse
twobits =
  parse """c5 g4*2 aflat4 g4
   ~ [d4,f4,g4,b4] [c4,e4,g4,c5] ~"""

wag :: AFuture
wag =
  make 4.0
    { earth: s $ (map <<< map) triangleSynth
        $ map (changeVolume (const 0.4))
        $ b twobits
            [ i twobits [twobits, twobits]
            , flatten twobits
            , x twobits [reverse twobits]
            ]

    , wind: s $ map (changeVolume (const 0.5))
        $ parse "~ [~ [hh, bd] [hh, bd] ~]"
    }

main :: Player
main = player $ tdl $ wag
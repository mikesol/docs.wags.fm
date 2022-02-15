module Docs.Index.ShaveAndAHaircut where

import Prelude

import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Cycle (reverse)
import WAGS.Lib.Tidal.Synth (triangleSynth)
import WAGS.Lib.Tidal.Tidal
  (b, changeVolume, i, make, parse, s, x)
import WAGS.Lib.Tidal.Types (AFuture)

p = parse
twobits o0 o1 o2 o3 o4 o5 = o0
  ( o1 (p "c5")
      [ o2 (p "g4") [ p "g4" ]
      , p "aflat4"
      , p "g4"
      ]
  )
  [ o3 (p "~")
      [ o4 (p "d4") [ p "f4", p "g4", p "b4" ]
      , o5 (p "c4") [ p "e4", p "g4", p "c5" ]
      , (p "~")
      ]
  ]

wag :: AFuture
wag =
  make 4.0
    { earth: s $ (map <<< map) triangleSynth
        $ map (changeVolume (const 0.4))
        $ b (twobits i i i i x x)
            [ twobits i x i x i x
            , twobits x i x i x i
            , reverse $ twobits i i i i x x
            ]

    , wind: s $ map (changeVolume (const 0.5))
        $ parse "~ [~ [hh, bd] [hh, bd] ~]"
    }

main :: Player
main = player $ tdl $ wag
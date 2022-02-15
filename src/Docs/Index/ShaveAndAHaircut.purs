module Docs.Index.ShaveAndAHaircut where

import Prelude

import Data.NonEmpty ((:|))
import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Cycle (flatten, r, reverse)
import WAGS.Lib.Tidal.Synth (triangleSynth)
import WAGS.Lib.Tidal.Tidal (b, changeVolume, i, make, nefy, parse, s, x)
import WAGS.Lib.Tidal.Types (AFuture)

p = parse
twobits f =
  i (p "c5 g4*2 aflat4 g4")
    [ i r
        [ nefy f $ map parse ("d4" :| [ "f4", "g4", "b4" ])
        , nefy f $ map parse ("c4" :| [ "e4", "g4", "c5" ])
        , r
        ]
    ]

wag :: AFuture
wag =
  make 4.0
    { earth: s $ (map <<< map) triangleSynth
        $ map (changeVolume (const 0.4))
        $ b (twobits x)
            [ i (twobits x) [ twobits x ]
            , twobits i
            , x (twobits x) [ reverse (twobits i) ]
            ]

    , wind: s $ map (changeVolume (const 0.5))
        $ parse "~ [~ [hh, bd] [hh, bd] ~]"
    }

main :: Player
main = player $ tdl $ wag
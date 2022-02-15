module Docs.Index.ShaveAndAHaircut where

import Prelude

import Type.Proxy (Proxy(..))
import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Synth (synth)
import WAGS.Lib.Tidal.Tidal (changeVolume, make, parse, s)
import WAGS.Lib.Tidal.Types (AFuture)

wag :: AFuture
wag =
  make 6.0
    { earth: s $ (map <<< map) (synth {})
        $ map
            ( changeVolume
                ( _.normalizedLittleCycleTime
                    >>> (_ < 0.33)
                    >>> if _ then 1.0 else 0.5
                )
            )
        $ parse
            ( Proxy :: _
                """
        [c5 g4*2 aflat4 g4]
        [~ [d4,f4,g4,b4] [c4,e4,g4,c5] ~] ~"""
            )
    , wind: s $ map (changeVolume (const 0.5))
        $ parse (Proxy :: _ "~ [~ [hh, bd] [hh, bd] ~] ~")
    }

main :: Player
main = player $ tdl $ wag
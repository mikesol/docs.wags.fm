module Docs.Tidal.Notes.PlaybackRate where

import Prelude

import Data.Lens (set, traversed)
import Data.Lens.Iso.Newtype (unto)
import Data.Lens.Record (prop)
import Data.Newtype (over, unwrap)
import Data.Profunctor (lcmap)
import Data.Tuple.Nested ((/\))
import Type.Proxy (Proxy(..))
import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Learn.Oscillator (lfo)
import WAGS.Lib.Piecewise (simplePiecewise)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Tidal (changeRate, make, parse, s)
import WAGS.Lib.Tidal.Types (AFuture, Note(..))

wag :: AFuture
wag = make 2.0
  { earth: s
      $ map
          ( changeRate
              ( _.clockTime
                  >>> lfo { phase: 0.0, amp: 0.3, freq: 1.2 }
                  >>> add 1.0
              )
          )
      $ parse "baa:0"
  , wind: s
      $ set
          ( traversed <<< traversed
              <<< unto Note
              <<< prop (Proxy :: _ "rateFoT")
          )
          ( lcmap unwrap
              ( _.sampleTime >>>
                  simplePiecewise [ 0.0 /\ 1.2, 1.2 /\ 0.3 ]
              )
          )
      $ parse "baa:1"
  }

main :: Player
main = player $ tdl $ wag
module Docs.Tidal.Notes.Effect where

import Prelude

import Data.Lens (set, traversed)
import Data.Lens.Iso.Newtype (unto)
import Data.Lens.Record (prop)
import Data.Newtype (unwrap)
import Data.Tuple.Nested ((/\))
import Data.Profunctor (lcmap)
import Math ((%))
import Type.Proxy (Proxy(..))
import WAGS.Create.Optionals (highpass, bandpass)
import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Learn.Oscillator (lfo)
import WAGS.Lib.Piecewise (simplePiecewise)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.FX (fx, hello, goodbye)
import WAGS.Lib.Tidal.Tidal (changeEffect, make, parse, s)
import WAGS.Lib.Tidal.Types (AFuture, Note(..))

wag :: AFuture
wag = make 2.0
  { earth: s
      $ map
          ( changeEffect
              ( _.clockTime
                  >>> lfo
                    { phase: 0.0
                    , amp: 1000.0
                    , freq: 2.0
                    }
                  >>> add 2000.0
                  >>> flip highpass hello
                  >>> goodbye
                  >>> fx
              )
          )
      $ parse "baa:0"
  , wind: s
      $ set
          ( traversed <<< traversed
              <<< unto Note
              <<< prop (Proxy :: _ "tumultFoT")
          )
          ( lcmap unwrap
              ( _.clockTime
                  >>> (_ % 10.0)
                  >>> simplePiecewise
                    [ 0.0 /\ 100.0
                    , 2.0 /\ 1000.0
                    , 10.0 /\ 100.0
                    ]
                  >>> { q: 10.0, freq: _ }
                  >>> flip bandpass hello
                  >>> goodbye
                  >>> fx
              )
          )
      $ parse "crow:0"
  }

main :: Player
main = player $ tdl $ wag
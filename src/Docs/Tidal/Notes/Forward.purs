module Docs.Tidal.Notes.Forward where

import Prelude

import Data.Lens (set, traversed)
import Data.Lens.Iso.Newtype (unto)
import Data.Lens.Record (prop)
import Data.Newtype (unwrap)
import Data.Profunctor (lcmap)
import Math ((%))
import Type.Proxy (Proxy(..))
import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Tidal (changeForward, make, parse, s)
import WAGS.Lib.Tidal.Types (AFuture, Note(..))

wag :: AFuture
wag = make 2.0
  { earth: s
      $ map
          ( changeForward
              ( _.clockTime
                  >>> (_ % 1.3)
                  >>> (_ < 0.6)
                  >>> if _ then true else false
              )
          )
      $ parse "baa:0"
  , wind: s
      $ set
          ( traversed <<< traversed
              <<< unto Note
              <<< prop (Proxy :: _ "forwardFoT")
          )
          ( lcmap unwrap
              ( _.clockTime
                  >>> (_ % 0.35)
                  >>> (_ < 0.15)
                  >>> if _ then true else false
              )
          )
      $ parse "baa:1"
  }

main :: Player
main = player $ tdl $ wag
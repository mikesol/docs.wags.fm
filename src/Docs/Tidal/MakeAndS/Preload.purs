module Docs.Tidal.MakeAndS.Preload where

import Prelude

import Data.Lens (_2, over, traversed)
import Data.NonEmpty ((:|))
import Data.Tuple.Nested ((/\))
import Foreign.Object (fromHomogeneous, keys)
import Heterogeneous.Mapping (hmap)
import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Tidal (changeSampleF, make, parse, s, weightedChoice)
import WAGS.Lib.Tidal.Types (AFuture, BufferUrl(..), Sample(..))

sounds = fromHomogeneous $ hmap BufferUrl
  { tk0: "https://freesound.org/data/previews/178/178659_717950-lq.mp3"
  , tk1: "https://freesound.org/data/previews/178/178660_717950-lq.mp3"
  , tk2: "https://freesound.org/data/previews/107/107785_7390-lq.mp3"
  , tk3: "https://freesound.org/data/previews/562/562008_7107243-lq.mp3"
  , tk4: "https://freesound.org/data/previews/126/126531_2044671-lq.mp3"
  , kdm: "https://freesound.org/data/previews/344/344759_1676145-hq.mp3"
  }

wag :: AFuture
wag = make 1.0
  { earth: s
      $ map
          ( changeSampleF
              ( _.initialEntropy >>> weightedChoice
                  ( over
                      (traversed <<< _2)
                      Sample
                      ( (1.0 /\ "tk0") :|
                          [ 2.0 /\ "tk1"
                          , 4.0 /\ "tk2"
                          , 8.0 /\ "tk3"
                          , 16.0 /\ "tk4"
                          ]
                      )
                  )
              )
          )
      $ parse "x*5"
  , wind: s "kdm"
  , sounds
  , preload: map Sample $ keys sounds
  }

main :: Player
main = player $ tdl $ wag
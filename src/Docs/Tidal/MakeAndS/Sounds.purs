module Docs.Tidal.MakeAndS.Sounds where

import Prelude

import Foreign.Object (fromHomogeneous)
import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Tidal (make, s)
import WAGS.Lib.Tidal.Types (AFuture, BufferUrl(..))

sounds = map BufferUrl $ fromHomogeneous 
  { ohMy: "https://freesound.org/data/previews/235/235140_950925-hq.mp3"
  , iKnowYes: "https://freesound.org/data/previews/277/277594_5324256-lq.mp3"
  , whyHelloThere: "https://freesound.org/data/previews/323/323437_4347097-hq.mp3"
  }

wag :: AFuture
wag = make 4.0
  { earth: s $ "iKnowYes [ohMy whyHelloThere]"
  , sounds
  }

main :: Player
main = player $ tdl $ wag
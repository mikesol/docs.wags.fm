module Docs.Tidal.MakeAndS.Title where

import Prelude

import Foreign.Object (fromHomogeneous)
import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Tidal (make, s)
import WAGS.Lib.Tidal.Types (AFuture, BufferUrl(..))

sounds = map BufferUrl $ fromHomogeneous
  { also: "https://ia800501.us.archive.org/7/items/AlsoSprachZarathustraOp.30Strauss/Also%20Sprach%20Zarathustra%2C%20Op.%2030%20-%20Strauss.mp3"
  }

wag :: AFuture
wag = make 106.0
  { earth: s $ "also"
  , sounds
  , title: "Zarathustra spoke thusly"
  }

main :: Player
main = player $ tdl $ wag
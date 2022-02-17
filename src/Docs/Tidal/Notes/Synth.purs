module Docs.Tidal.Notes.Synth where

import Prelude

import Data.List (List(..), (:))
import Data.NonEmpty ((:|))
import Data.Tuple.Nested ((/\))
import WAGS.Create.Optionals (gain, sinOsc)
import WAGS.Graph.Parameter (ff)
import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Piecewise (makePiecewise)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.FX (fx, goodbye, hello)
import WAGS.Lib.Tidal.Synth (synth, triangleSynth)
import WAGS.Lib.Tidal.Tidal (make, parse, s)
import WAGS.Lib.Tidal.Types (AFuture, TimeIs(..))

wag :: AFuture
wag = make 2.0
  { earth: s
      $ (map <<< map) triangleSynth
      $ parse "[c4 c4 g4 g4 a4 a4 g4 ~] ~"
  , wind:
      let
        pw = makePiecewise
          ( (0.0 /\ 0.0)
              :| (0.11 /\ 0.4)
                : (0.21 /\ 0.1)
                : (0.32 /\ 0.0)
                : Nil
          )
      in
        s
          $ (map <<< map)
              ( synth
                  { synth:
                      \ifo
                       ( TimeIs
                           { sampleTime
                           , headroomInSeconds
                           }
                       ) -> fx
                        $ goodbye
                        $ gain
                            ( ff 0.03 $ pw
                                { time: sampleTime
                                , headroomInSeconds
                                }
                            )
                            { ipt: hello
                            , osc: sinOsc ifo.freq
                            }
                  }
              )

          $ parse "~ [f4 f4 e4 e4 d4 d4 c4 ~]"
  }

main :: Player
main = player $ tdl $ wag
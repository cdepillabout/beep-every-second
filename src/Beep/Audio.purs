
module Beep.Audio where

import Beep.Prelude

foreign import data Audio :: Type

foreign import newAudio :: String -> Effect Audio

foreign import playAudio :: Audio -> Effect Unit

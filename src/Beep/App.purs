module Beep.App where

import Beep.Audio (Audio, playAudio)
import Beep.Prelude
import React.Basic.DOM as R
import React.Basic.DOM.Events (capture_)
import React.Basic.Hooks
  ( ReactComponent, mkReducer, reactComponent , useReducer )
import React.Basic.Hooks as React

data Playing = Playing | NotPlaying

type AppState =
  { playing :: Playing
  }

initialAppState :: AppState
initialAppState =
  { playing: NotPlaying
  }

data Action = TogglePlaying

updateState :: AppState -> Action -> AppState
updateState state TogglePlaying =
  case state.playing of
    Playing -> state { playing = NotPlaying }
    NotPlaying -> state { playing = Playing }

play :: Playing -> Audio -> Effect Unit
play _ audio = playAudio audio

app :: Audio -> Effect (ReactComponent {})
app audio = do
  reducer <- mkReducer updateState
  reactComponent "App" \props -> React.do
    currState /\ doAction <- useReducer initialAppState reducer
    pure $
      R.div_
        [ R.h1_ [ R.text "Beep Every Second" ]
        , R.button
              { type: "button"
              , onClick:
                  capture_ do
                    doAction TogglePlaying
                    play Playing audio
              , children:
                  [ R.text $
                      case currState.playing of
                        Playing -> "Stop"
                        NotPlaying -> "Beep"
                  ]
              }
        ]

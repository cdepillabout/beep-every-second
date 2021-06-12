module Beep.App where

import Beep.Audio (Audio, playAudio)
import Beep.Prelude
import Effect.Timer (IntervalId, clearInterval, setInterval)
import React.Basic.DOM as R
import React.Basic.DOM.Events (capture_)
import React.Basic.Hooks
  ( ReactComponent, mkReducer, reactComponent, useReducer )
import React.Basic.Hooks as React

data Playing = Playing IntervalId | NotPlaying

derive instance Eq Playing

type AppState =
  { playing :: Playing
  }

initialAppState :: AppState
initialAppState =
  { playing: NotPlaying
  }

data Action = StartPlaying IntervalId | StopPlaying

updateState :: AppState -> Action -> AppState
updateState state = case _ of
  StartPlaying intervalId ->
    state { playing = Playing intervalId }
  StopPlaying ->
    state { playing = NotPlaying }

play :: Audio -> Effect Unit
play audio = playAudio audio

app :: Audio -> Effect (ReactComponent {})
app audio = do
  reducer <- mkReducer updateState
  reactComponent "App" \_ -> React.do
    currState /\ doAction <- useReducer initialAppState reducer
    pure $
      R.div_
        [ R.h1_ [ R.text "Beep Every Second" ]
        , R.button
              { type: "button"
              , onClick:
                  capture_ do
                    case currState.playing of
                      NotPlaying -> do
                        intervalId <- setInterval 1000 $ play audio
                        doAction $ StartPlaying intervalId
                      Playing intervalId -> do
                        clearInterval intervalId
                        doAction StopPlaying
              , children:
                  [ R.text $
                      case currState.playing of
                        Playing _ -> "Stop"
                        NotPlaying -> "Beep"
                  ]
              }
        ]

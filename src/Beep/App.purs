module Beep.App where

import Beep.Prelude
import React.Basic.DOM as R
import React.Basic.DOM.Events (capture, capture_, targetValue)
import React.Basic.Hooks
  ( Hook, JSX, ReactComponent, UseEffect, UseState, coerceHook, component
  , fragment, keyed, mkReducer, reactComponent, readRefMaybe, useEffect
  , useReducer, useRef, useState
  )
import React.Basic.Hooks as React
import React.Basic.Hooks.Aff (useAff)

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

app :: Effect (ReactComponent {})
app = do
  reducer <- mkReducer updateState
  reactComponent "App" \props -> React.do
    currState /\ doAction <- useReducer initialAppState reducer
    pure $
      R.div_
        [ R.h1_ [ R.text "My Hacker Stories" ]
        , R.button
              { type: "button"
              , onClick: capture_ (doAction TogglePlaying)
              , children:
                  [ R.text $
                      case currState.playing of
                        Playing -> "Stop"
                        NotPlaying -> "Beep"
                  ]
              }
        ]

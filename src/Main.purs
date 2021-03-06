module Main where

import Beep.Prelude

import Beep.Audio (Audio)
import Beep.App (app)
import Effect.Exception (throw)
import React.Basic.DOM (render)
import React.Basic.Hooks (element)
import Web.DOM.NonElementParentNode (getElementById)
import Web.HTML (window)
import Web.HTML.HTMLDocument (toNonElementParentNode)
import Web.HTML.Window (document)

main :: Audio -> Effect Unit
main audio = do
  log "main, starting..."
  win <- window
  doc <- document win
  root <- getElementById "app" (toNonElementParentNode doc)
  case root of
    Nothing -> do
      log "main, no app id element found..."
      throw "Root element not found."
    Just r  -> do
      log "main, found app id element...."
      a <- app audio
      render (element a {}) r

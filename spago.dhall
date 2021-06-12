{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "beep-every-second"
, dependencies =
    [ "console"
    , "effect"
    , "exceptions"
    , "maybe"
    , "prelude"
    , "psci-support"
    , "react-basic-dom"
    , "react-basic-hooks"
    , "tuples"
    , "web-dom"
    , "web-html"
    ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}

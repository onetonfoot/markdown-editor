module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Browser
import Markdown


main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model defaultText, Cmd.none )


defaultText : String
defaultText =
    """# Markdown example

An online markdown editor written in Elm.
Code highlighting thanks to highlight.js

```julia
print("Hello World")
```

"""



--Model


type alias Model =
    { input : String }


type Msg
    = Typing String



--Update


update msg { input } =
    case msg of
        Typing newStr ->
            ( Model newStr, Cmd.none )


subscriptions model =
    Sub.none



-- View


view model =
    div []
        [ header model
        , editor model
        ]


header model =
    div [ id "header", class "flex" ]
        [ h1 [] [ text "Markdown Editor" ]
        , p [] [ text "A simple markdown editor written in elm" ]
        ]


editor model =
    div [ id "editor", class "flex" ]
        [ div [ id "text-editor" ] [ textarea [ id "text-area", value model.input, onInput Typing ] [] ]
        , div [ id "live-preview" ] [ Markdown.toHtml [] model.input ]
        ]

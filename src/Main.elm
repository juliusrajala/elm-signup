module Main exposing (..)

import Html exposing (Html)
import Types exposing (Model, Msg)
import Update exposing (update)
import Views.Main exposing (view)

initialState : Model
initialState =
    { email = ""
    , firstName = ""
    , lastName = ""
    , organization = ""
    , password = ""
    , repeatPassword = ""
    , currentForm = Types.Account
    , validEmail = False
    }

init : ( Model, Cmd Msg )
init = ( initialState , Cmd.none )

---- PROGRAM ----

main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }

module Utils.Attributes exposing (..)

import Types exposing (Model, Msg)
import Html exposing (Html, Attribute)
import Html.Events exposing (onWithOptions)

import Json.Decode as Decode exposing (..)

onClick : Msg -> Attribute Msg
onClick msg =
    onWithOptions "click" { stopPropagation = True, preventDefault = True } (Decode.succeed msg)

onSubmit : Msg -> Attribute Msg
onSubmit msg =
    onWithOptions "submit" { stopPropagation = True, preventDefault = True } (Decode.succeed msg)


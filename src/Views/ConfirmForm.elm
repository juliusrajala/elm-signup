module Views.ConfirmForm exposing (..)

import Types exposing (Model, Msg)
import Html exposing (Html, Attribute, text, div, h1, p, img, form, input, label, button, span)
import Html.Attributes exposing (src, class, type_)

confirmForm : Model -> Html Msg
confirmForm model =
    form [ class "SignupForm" ]
        [ text "Confirm form" ]
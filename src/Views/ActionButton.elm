module Views.ActionButton exposing (..)

import Html exposing (Html, Attribute, text, p, img, form, input, label, button)
import Html.Attributes exposing (class)
import Types exposing (Model, Msg)
import Utils.Attributes exposing (onClick)

actionButton : String -> Bool -> Msg -> Html Msg
actionButton label valid action =
  if valid then
      button [ class "SignupForm-button", onClick action ] [ text label ]
  else button [ class "SignupForm-button--Invalid", onClick Types.NoOp ] [ text label ]

module Views.DetailsForm exposing (..)

import Types exposing (Model, Msg)
import Html exposing (Html, Attribute, text, div, h1, p, img, form, input, label, button, span)
import Html.Attributes exposing (src, class, type_)
import Html.Events exposing (onInput)

detailsForm : Model -> Html Msg
detailsForm model =
    form [ class "SignupForm" ]
        [ p [ class "SignupContainer-description" ] [ text "General information about account owner." ]
        , label [ class "Input-label", onInput (Types.MsgForDetails << Types.ChangeOrganization) ] [ text "Organization", input [ class "Input-field" ] [] ]
        , label [ class "Input-label", onInput (Types.MsgForDetails << Types.ChangeFirstname) ] [ text "Firstname", input [ class "Input-field" ] [] ]
        , label [ class "Input-label", onInput (Types.MsgForDetails << Types.ChangeLastname) ] [ text "Lastname", input [ class "Input-field" ] [] ]
        ]
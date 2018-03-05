module Views.DetailsForm exposing (..)

import Types exposing (Model, Msg)
import Html exposing (Html, text, p, form, input, label, button)
import Html.Attributes exposing (src, class, type_, value)
import Html.Events exposing (onInput)

import Utils.Validation exposing (validPassword)
import Views.ActionButton exposing (actionButton)

detailsForm : Model -> Html Msg
detailsForm model =
    form [ class "SignupForm" ]
        [ p [ class "SignupContainer-description" ] [ text "General information about account owner." ]
        , label [ class "Input-label", onInput (Types.MsgForDetails << Types.ChangeOrganization) ]
            [ text "Organization", input [ class "Input-field", value model.organization ] [] ]
        , label [ class "Input-label", onInput (Types.MsgForDetails << Types.ChangeFirstname) ]
            [ text "Firstname", input [ class "Input-field", value model.firstName ] [] ]
        , label [ class "Input-label", onInput (Types.MsgForDetails << Types.ChangeLastname) ]
            [ text "Lastname", input [ class "Input-field", value model.lastName ] [] ]
        , actionButton "Next" (validPassword model) (Types.SetView Types.Confirm)
        ]
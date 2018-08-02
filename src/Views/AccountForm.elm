module Views.AccountForm exposing (..)

import Html exposing (Html, Attribute, text, p, img, form, input, label, button)
import Html.Attributes exposing (src, class, type_, value)
import Html.Events exposing (onInput)

import Types exposing (Model, Msg)
import Utils.Strings exposing (formTitle, welcomeMessage)
import Utils.Validation exposing (isFormValid)
import Views.ActionButton exposing (actionButton)

accountForm : Model -> Html Msg
accountForm model =
    form [ class "SignupForm" ]
        [ p [ class "SignupContainer-description" ] [ text welcomeMessage ]
        , label [ class "Input-label", onInput (Types.MsgForAccount << Types.ChangeEmail) ]
            [ text "Email", input [ class "Input-field" , value model.email] [] ]
        , label [ class "Input-label", onInput (Types.MsgForAccount << Types.ChangePassword) ]
            [ text "Password", input [ class "Input-field", type_ "password", value model.password ] [] ]
        , label [ class "Input-label", onInput (Types.MsgForAccount << Types.ChangeRepeatPassword) ]
            [ text "Repeat password", input [ class "Input-field", type_ "password", value model.repeatPassword ] [] ]
        , actionButton "Next" (isFormValid Types.Account model) (Types.SetView Types.Details)
        ]
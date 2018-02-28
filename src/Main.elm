module Main exposing (..)

import Html exposing (Html, Attribute, text, div, h1, p, img, form, input, label, button, span)
import Html.Attributes exposing (src, class, type_)
import Html.Events exposing (onWithOptions, onInput, on)
import Types exposing (Model, FormView, Msg)
import Update exposing (update)
import Strings exposing (formTitle, welcomeMessage)

-- import DetailsForm exposing (detailsForm)

import Json.Decode as Decode exposing (..)
-- import Json.Encode as Encode exposing (..)

---- MODEL ----

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
init =
    ( initialState , Cmd.none )

isPasswordValid : String -> String -> Bool
isPasswordValid password repeatPassword =
    password == repeatPassword && String.length password > 5

formToOpen : Model -> FormView
formToOpen model =
    case model.currentForm of
        Types.Account -> Types.Details
        Types.Details -> Types.Confirm
        Types.Confirm -> Types.Confirm

---- UPDATE ----

onClick : Msg -> Attribute Msg
onClick msg =
    onWithOptions "click" { stopPropagation = True, preventDefault = True } (Decode.succeed msg)

onSubmit : Msg -> Attribute Msg
onSubmit msg =
    onWithOptions "submit" { stopPropagation = True, preventDefault = True } (Decode.succeed msg)

---- VIEW ----

view : Model -> Html Msg
view model =
    div [ class "PageContainer" ]
        [ signupForm model
        ]

formNavigation : Model -> Html Msg
formNavigation model =
    div [ class "FormNavigation" ]
        [ div [ class "FormNavigation-item" ]
            [ span [ class "FormNavigation-box" ] []
            , span [ class "FormNavigation-text" ] [ text "Account" ]
            ]
        , div [ class "FormNavigation-item" ]
            [ span [ class "FormNavigation-box" ] []
            , span [ class "FormNavigation-text" ] [ text "User info" ]
            ]
        , div [ class "FormNavigation-item" ]
            [ span [ class "FormNavigation-box" ] []
            , span [ class "FormNavigation-text" ] [ text "Confirmation" ]
            ]
        ]

signupForm : Model -> Html Msg
signupForm model =
    let
        validPassword : Bool
        validPassword = isPasswordValid model.password model.repeatPassword

        passwordClasses : String
        passwordClasses =
            if validPassword then
                "Input-field Input-field--Valid"
            else
                "Input-field"
        
        nextButton : Html Msg
        nextButton =
            if validPassword then
                button [ class "SignupForm-button", onClick (Types.SetView (formToOpen model)) ] [ text "Next" ]
            else
                button [ class "SignupForm-button" ] [ text "Fix" ]
    in
        div [ class "SignupContainer" ]
            [ formNavigation model
            , div [ class "SignupContainer-form" ]
                [ h1 [ class "SignupContainer-title" ][ text formTitle ]
                , accountForm model
                ]
            ]

accountForm : Model -> Html Msg
accountForm model =
    form [ class "SignupForm" ]
        [ p [ class "SignupContainer-description" ] [ text welcomeMessage ]
        , label [ class "Input-label", onInput (Types.MsgForAccount << Types.ChangeEmail) ] [ text "Email", input [ class "Input-field" ] [] ]
        , label [ class "Input-label", onInput (Types.MsgForAccount << Types.ChangePassword) ] [ text "Password", input [ class "Input-field", type_ "password"  ] [] ]
        , label [ class "Input-label", onInput (Types.MsgForAccount << Types.ChangeRepeatPassword) ] [ text "Repeat password", input [ class "Input-field", type_ "password"  ] [] ]
        ]


---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }

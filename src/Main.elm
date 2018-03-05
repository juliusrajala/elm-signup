module Main exposing (..)

import Html exposing (Html, Attribute, text, div, h1, p, img, form, input, label, button, span)
import Html.Attributes exposing (src, class, type_)
import Types exposing (Model, FormView, Msg)
import Update exposing (update)

import Views.FormNavigation exposing (formNavigation)
import Views.DetailsForm exposing (detailsForm)
import Views.AccountForm exposing (accountForm)
import Views.ConfirmForm exposing (confirmForm)

import Utils.Strings exposing (formTitle, welcomeMessage)
import Utils.Attributes exposing (onClick)

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

---- VIEW ----

view : Model -> Html Msg
view model =
    div [ class "PageContainer" ]
        [ signupForm model
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
                , case model.currentForm of
                    Types.Account -> accountForm model
                    Types.Details -> detailsForm model
                    Types.Confirm -> confirmForm model
                ]
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

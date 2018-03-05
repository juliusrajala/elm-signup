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
init = ( initialState , Cmd.none )

---- VIEW ----

view : Model -> Html Msg
view model =
    div [ class "PageContainer" ]
        [ div [ class "SignupContainer" ]
            [ formNavigation model
            , div [ class "SignupContainer-form" ]
                [ h1 [ class "SignupContainer-title" ][ text formTitle ]
                , case model.currentForm of
                    Types.Account -> accountForm model
                    Types.Details -> detailsForm model
                    Types.Confirm -> confirmForm model
                ]
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

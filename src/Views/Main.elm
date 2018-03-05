module Views.Main exposing (..)

import Html exposing (Html, text, div, h1, p, button)
import Html.Attributes exposing (src, class, type_)
import Types exposing (Model, Msg)

import Views.FormNavigation exposing (formNavigation)
import Views.DetailsForm exposing (detailsForm)
import Views.AccountForm exposing (accountForm)
import Views.ConfirmForm exposing (confirmForm)

import Utils.Strings exposing (formTitle, welcomeMessage)

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
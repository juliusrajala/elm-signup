module Views.FormNavigation exposing (..)

import Types exposing (Model, Msg)
import Html exposing (Html, Attribute, text, div, h1, p, img, form, input, label, button, span)
import Html.Attributes exposing (src, class, type_)
import Utils.Attributes exposing (onClick)

formNavigation : Model -> Html Msg
formNavigation model =
    div [ class "FormNavigation" ]
        [ div 
            [ class "FormNavigation-item"
            , onClick (Types.SetView Types.Account)
            ]
            [ span [ class "FormNavigation-box" ] []
            , span [ class "FormNavigation-text" ] [ text "Account" ]
            ]
        , div 
            [ class "FormNavigation-item"
            , onClick (Types.SetView Types.Details)
            ]
            [ span [ class "FormNavigation-box" ] []
            , span [ class "FormNavigation-text" ] [ text "User info" ]
            ]
        , div
            [ class "FormNavigation-item"
            , onClick (Types.SetView Types.Confirm)
            ]
            [ span [ class "FormNavigation-box" ] []
            , span [ class "FormNavigation-text" ] [ text "Confirmation" ]
            ]
        ]
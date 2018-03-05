module Views.FormNavigation exposing (..)

import Types exposing (Model, Msg, FormView)
import Html exposing (Html, Attribute, text, div, h1, p, img, form, input, label, button, span)
import Html.Attributes exposing (src, class, type_)
import Utils.Attributes exposing (onClick)

selectedItemClasses : Model -> FormView -> String
selectedItemClasses model view =
    if view == model.currentForm then
        "FormNavigation-item FormNavigation-item--Active"
    else "FormNavigation-item"

formNavigation : Model -> Html Msg
formNavigation model =
    div [ class "FormNavigation" ]
        [ div 
            [ class (selectedItemClasses model Types.Account)
            , onClick (Types.SetView Types.Account)
            ]
            [ span [ class "FormNavigation-box" ] []
            , span [ class "FormNavigation-text" ] [ text "Account" ]
            ]
        , div 
            [ class (selectedItemClasses model Types.Details)
            , onClick (Types.SetView Types.Details)
            ]
            [ span [ class "FormNavigation-box" ] []
            , span [ class "FormNavigation-text" ] [ text "User info" ]
            ]
        , div
            [ class (selectedItemClasses model Types.Confirm)
            , onClick (Types.SetView Types.Confirm)
            ]
            [ span [ class "FormNavigation-box" ] []
            , span [ class "FormNavigation-text" ] [ text "Confirmation" ]
            ]
        ]
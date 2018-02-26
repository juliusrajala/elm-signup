module DetailsForm exposing (..)

import Types exposing (Model)
import Html exposing (Html, Attribute, text, div, h1, p, img, form, input, label, button, span)
import Html.Attributes exposing (src, class, type_)
import Html.Events exposing (onWithOptions, onInput)


-- UPDATE --

type Msg
    = ChangeFirstname String
    | ChangeLastname String
    | ChangeOrganization String
    | NoOp

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeFirstname firstName ->
            ( { model | firstName = firstName }, Cmd.none )
        ChangeLastname lastName ->
            ( { model | lastName = lastName }, Cmd.none )
        ChangeOrganization organization ->
            ( { model | organization = organization }, Cmd.none )
        NoOp -> ( model, Cmd.none )

-- VIEW --

detailsForm : Model -> Html Msg
detailsForm model =
    form [ class "SignupForm" ]
        [ p [ class "SignupContainer-description" ] [ text "General information about account owner." ]
        , label [ class "Input-label", onInput ChangeOrganization ] [ text "Organization", input [ class "Input-field" ] [] ]
        , label [ class "Input-label", onInput ChangeFirstname ] [ text "Firstname", input [ class "Input-field" ] [] ]
        , label [ class "Input-label", onInput ChangeLastname ] [ text "Lastname", input [ class "Input-field" ] [] ]
        ]
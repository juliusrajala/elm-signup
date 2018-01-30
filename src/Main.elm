module Main exposing (..)

import Html exposing (Html, Attribute, text, div, h1, p, img, form, input, label, button)
import Html.Attributes exposing (src, class, type_)
import Html.Events exposing (onWithOptions, onInput)

import Json.Decode as Decode exposing (..)
import Json.Encode as Encode exposing (..)


---- Strings ----

formTitle : String
formTitle = "Sign up for Service X"

welcomeMessage : String
welcomeMessage = "Just sign up for service X and you are ready to start changing things today!"

---- MODEL ----


type alias Model =
    { email : String
    , firstname : String
    , lastname : String
    , organization : String
    , validEmail : Bool
    }

initialState : Model
initialState =
    { email = ""
    , firstname = ""
    , lastname = ""
    , organization = ""
    , validEmail = False
    }

init : ( Model, Cmd Msg )
init =
    ( initialState , Cmd.none )



---- UPDATE ----

onClick : Msg -> Attribute Msg
onClick msg =
    onWithOptions "click" { stopPropagation = True, preventDefault = True } (Decode.succeed msg)

onSubmit : Msg -> Attribute Msg
onSubmit msg =
    onWithOptions "submit" { stopPropagation = True, preventDefault = True } (Decode.succeed msg)

type Msg
    = ChangeEmail String
    | ChangeFirstname String
    | ChangeLastname String
    | ChangeOrganization String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeEmail email ->
            ( { model | email = email }, Cmd.none )
        ChangeFirstname firstname ->
            ( { model | firstname = firstname }, Cmd.none )
        ChangeLastname lastname ->
            ( { model | lastname = lastname }, Cmd.none )
        ChangeOrganization organization ->
            ( { model | organization = organization }, Cmd.none )


---- VIEW ----


view : Model -> Html Msg
view model =
    div [ class "PageContainer" ]
        [ signupForm model
        ]

signupForm : Model -> Html Msg
signupForm model =
    div [ class "SignupContainer" ]
        [ h1 [ class "SignupContainer-title" ] [ text formTitle ]
        , p [ class "SignupContainer-description" ]
            [ text welcomeMessage ]
        , form [ class "SignupForm" ]
            [ label [ class "Input-label", onInput ChangeEmail ] [ text "Email", input [ class "Input-field" ] [] ]
            , label [ class "Input-label", onInput ChangeFirstname ] [ text "Firstname", input [ class "Input-field" ] [] ]
            , label [ class "Input-label", onInput ChangeLastname ] [ text "Lastname", input [ class "Input-field" ] [] ]
            , label [ class "Input-label", onInput ChangeOrganization ] [ text "Organization", input [ class "Input-field" ] [] ]
            , button [ class "SignupForm-button" ] [ text "Next" ]
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

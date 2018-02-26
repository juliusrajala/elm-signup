module Main exposing (..)

import Html exposing (Html, Attribute, text, div, h1, p, img, form, input, label, button, span)
import Html.Attributes exposing (src, class, type_)
import Html.Events exposing (onWithOptions, onInput)
import Types exposing (Model, FormView)

import DetailsForm exposing (detailsForm)

import Json.Decode as Decode exposing (..)
-- import Json.Encode as Encode exposing (..)


---- Strings ----

formTitle : String
formTitle = "Sign up for Service X"

welcomeMessage : String
welcomeMessage = "Just sign up for service X and you are ready to start changing things today!"

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

type Msg
    = ChangeEmail String
    | ChangePassword String
    | ChangeRepeatPassword String
    | SetView FormView
    | NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeEmail email ->
            ( { model | email = email }, Cmd.none )
        ChangePassword password ->
            ( { model | password = password }, Cmd.none )
        ChangeRepeatPassword repeatPassword ->
            ( { model | repeatPassword = repeatPassword }, Cmd.none )
        SetView view ->
            ( { model | currentForm = view}, Cmd.none )
        NoOp -> ( model, Cmd.none )

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
                button [ class "SignupForm-button", onClick (SetView (formToOpen model)) ] [ text "Next" ]
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
                    Types.Confirm -> accountForm model
                , nextButton
                ]
            ]

accountForm : Model -> Html Msg
accountForm model =
    form [ class "SignupForm" ]
        [ p [ class "SignupContainer-description" ] [ text welcomeMessage ]
        , label [ class "Input-label", onInput ChangeEmail ] [ text "Email", input [ class "Input-field" ] [] ]
        , label [ class "Input-label", onInput ChangePassword ] [ text "Password", input [ class "Input-field", type_ "password"  ] [] ]
        , label [ class "Input-label", onInput ChangeRepeatPassword ] [ text "Repeat password", input [ class "Input-field", type_ "password"  ] [] ]
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

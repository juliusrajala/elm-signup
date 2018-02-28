module Update exposing (..)

import Types exposing (..)

updateAccount : AccountMsg -> Model -> ( Model, Cmd Msg )
updateAccount msg model =
    case msg of
        Types.ChangeEmail email ->
            ( { model | email = email }, Cmd.none )
        Types.ChangePassword password ->
            ( { model | password = password }, Cmd.none )
        Types.ChangeRepeatPassword repeatPassword ->
            ( { model | repeatPassword = repeatPassword }, Cmd.none )

updateDetails : DetailsMsg -> Model -> ( Model, Cmd Msg )
updateDetails msg model =
    case msg of
        Types.ChangeFirstname firstName ->
            ( { model | firstName = firstName }, Cmd.none )
        Types.ChangeLastname lastName ->
            ( { model | lastName = lastName }, Cmd.none )
        Types.ChangeOrganization organization ->
            ( { model | organization = organization }, Cmd.none )

update : Msg -> Model -> ( Model, Cmd Msg )
update msgFor model =
    case msgFor of
      Types.MsgForAccount msg ->
          updateAccount msg model
      Types.MsgForDetails msg ->
          updateDetails msg model
      Types.SetView view ->
          ( { model | currentForm = view}, Cmd.none )

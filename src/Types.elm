module Types exposing (..)

type alias Model =
    { email : String
    , firstName : String
    , lastName : String
    , organization : String
    , password : String
    , repeatPassword : String
    , currentForm : FormView
    , validEmail : Bool
    }

type FormView
    = Account
    | Details
    | Confirm

--- Update

type AccountMsg
    = ChangeEmail String
    | ChangePassword String
    | ChangeRepeatPassword String


type DetailsMsg
    = ChangeFirstname String
    | ChangeLastname String
    | ChangeOrganization String

type Msg
    = MsgForAccount AccountMsg
    | MsgForDetails DetailsMsg
    | SetView FormView
    | NoOp 

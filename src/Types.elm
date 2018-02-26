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
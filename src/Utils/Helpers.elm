module Utils.Helpers exposing (..)

import Utils.Validation exposing (validPassword)
import Types exposing (..)

validateForm : Model -> Model
validateForm model =
    if validPassword model then
        { model | validForms = Account :: model.validForms }
    else model
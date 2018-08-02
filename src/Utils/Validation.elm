module Utils.Validation exposing (..)

import Types exposing (Model)

validPassword : Model -> Bool
validPassword model =
    model.password == model.repeatPassword && String.length model.password > 5

isFormValid : Types.FormView -> Model -> Bool
isFormValid formView model = List.member formView model.validForms

module Views.ChipView exposing (view)

import Components.Card as Card
import Components.Chip as Chip
import Components.Info as Info
import Components.Navigation as Navigation
import Components.Page as Page
import Components.Title as Title
import Element
import Html exposing (Html)
import Types exposing (Model, Msg(..))


view : Model -> Html Msg
view model =
    Element.layout [] <|
        Element.column
            [ Element.width Element.fill
            , Element.height Element.fill
            ]
            [ Page.page
                { title = "Components"
                , nav =
                    model.navItems
                        |> List.map
                            (\item ->
                                ( item, NavSelected item )
                            )
                        |> Navigation.nav
                        |> Navigation.withSelectedItem
                            model.selectedNav
                , body =
                    [ Title.title "Chip Component"
                        |> Title.withSize2xl
                        |> Title.toMarkup
                    , Info.info
                        "This Beta component is currently under review, so please join in and give us your feedback on the PatternFly forum."
                        |> Info.withTitle "This is a Title"
                        |> Info.withDefaultIcon
                        |> Info.toMarkup
                    , Element.row [ Element.paddingXY 0 10, Element.spacing 10 ] <|
                        [ Card.card
                            [ Chip.chip "English"
                                |> Chip.toMarkup
                            , model.exampleChip
                                |> Maybe.map
                                    (\c ->
                                        Chip.chip c
                                            |> Chip.withCloseMsg RemoveExampleChip
                                            |> Chip.toMarkup
                                    )
                                |> Maybe.withDefault Element.none
                            ]
                            |> Card.withTitle "Chip Examples"
                            |> Card.toMarkup
                        ]
                    ]
                }
                |> Page.toMarkup
            ]

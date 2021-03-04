(define (problem multi-agent)
(:domain ProblemaPacientes1)
(:objects
        A                       - ambulancia
        G                       - enfermogripe
        C                       - enfermocovid
        H                       - hospital
        l1 l2 l3 l4             - localizacion
        )
(:init

        ; Localizacion ambulancia
        (loc A l1)

        ; Localizacion hospital
        (loc H l1)

        ; Capacidad para recoger enfermos
        (puede_recoger A)

        ; Capacidad para dejar enfermos en una localizacion
        (puede_dejar A)


        ; Links
        (link A l1 l2)
        (link A l2 l4)
        (link A l4 l3)
        (link A l3 l4)
        (link A l4 l2)
        (link A l2 l1)

        ; Localizacion de los enfermos
        (loc_enfermo G l4)
        (loc_enfermo C l3)

        (hay_hospital H l1)
)

(:goal

        (and
                (or
                        (and 
                                (hay_hospital H l1)
                                (loc_enfermo G l1)
                        )

                        (and 
                                (hay_hospital H l2)
                                (loc_enfermo G l2)
                        )

                        (and 
                                (hay_hospital H l3)
                                (loc_enfermo G l3)
                        )

                        (and 
                                (hay_hospital H l4)
                                (loc_enfermo G l4)
                        )
                )

                (or

                        (and 
                                (hay_hospital H l1)
                                (loc_enfermo C l1)
                        )

                        (and 
                                (hay_hospital H l2)
                                (loc_enfermo C l2)
                        )

                        (and 
                                (hay_hospital H l3)
                                (loc_enfermo C l3)
                        )

                        (and 
                                (hay_hospital H l4)
                                (loc_enfermo C l4)
                        )
                )
        )
)
)

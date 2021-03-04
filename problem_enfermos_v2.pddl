(define (problem multi-agent)
(:domain ProblemaPacientes2)
(:objects
        A                       - ambulancia
        G                       - enfermogripe
        C                       - enfermocovid
        D                       - enfermocovid
        H I                     - hospital
        l1 l2 l3 l4 l5 l6 l7    - localizacion
        )
(:init

        ; Localizacion ambulancia
        (loc A l1)

        ; Localizacion hospital
        (loc H l1)
        (loc I l6)

        ; Capacidad para recoger enfermos
        (puede_recoger A)

        ; Capacidad para dejar enfermos en una localizacion
        (puede_dejar A)


        ; Links
        (link A l1 l2)
        (link A l2 l7)
        (link A l7 l4)
        (link A l4 l3)
        (link A l3 l2)
        (link A l4 l5)
        (link A l5 l6)
        (link A l6 l5)
        (link A l5 l4)
        (link A l4 l7)
        (link A l7 l2)
        (link A l2 l1)
        (link A l3 l4)


        ; Localizacion de los enfermos
        (loc_enfermo G l4)
        (loc_enfermo C l3)
        (loc_enfermo D l5)

        (hay_hospital l1)
        (hay_hospital l6)
)

(:goal

        (and
                (enfermo_ingresado G)
                (enfermo_ingresado C)
                (enfermo_ingresado D)
        )
)
)

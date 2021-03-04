(define (problem multi-agent)
(:domain ProblemaPacientes3)
(:objects
        A B                     - ambulancia
        G                       - enfermogripe
        C                       - enfermocovid
        D                       - enfermocovid
        H I                     - hospital
        l1 l2 l3 l4 l5 l6 l7    - localizacion
        )
(:init

        ; Localizacion ambulancia
        (loc A l1)
        (loc A l6)

        ; Localizacion hospital
        (loc H l1)
        (loc I l6)

        ; Capacidad para recoger enfermos
        (puede_recoger A)
        (puede_recoger B)

        ; Capacidad para dejar enfermos en una localizacion
        (puede_dejar A)
        (puede_dejar B)


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
        (loc_enfermo D l4)
        (loc_enfermo C l4)
        (loc_enfermo G l3)

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

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
                (loc_enfermo G ?u)
                (loc_enfermo C ?w)
                (hay_hospital H ?u)
                (hay_hospital H ?w)
        )
)
)

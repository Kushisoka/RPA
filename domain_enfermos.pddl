(define (domain ProblemaPacientes1)
(:requirements :typing)
(:types
        agent sample localizacion enfermo hospital - object
        ambulancia  - agent
        enfermocovid enfermogripe - enfermo)

(:predicates (loc ?a - ambulancia ?u - localizacion)
             (link ?a - ambulancia ?u - localizacion ?w - localizacion) ; hay un link entre la localizacion u y la w con la ambulancia a
             (tiene ?e - enfermo ?a - ambulancia) ; la ambulancia a tiene un enfermo e
             (loc_enfermo ?e - enfermo ?u - localizacion)  ; hay enfermo en la localizacion u

             (puede_recoger ?a - ambulancia)
             (puede_dejar ?a - ambulancia)

             (hay_hospital ?h - hospital ?u - localizacion) ; hay hospital h en la localizacion u

)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;   Acciones de la Ambulancia   ;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(:action Conducir
:parameters     (?a - ambulancia ?u - localizacion ?w - localizacion)
:precondition
        (and
                (link ?a ?u ?w)
                (loc ?a ?u)
        )
:effect
        (and
                (loc ?a ?w)
                (not (loc ?a ?u))
        )
)

(:action Recoger
:parameters     (?a - ambulancia ?e - enfermo ?u - localizacion)
:precondition
        (and
                (loc ?a ?u)
        (puederecoger ?a)
                (loc_enfermo ?e ?u)
        )
:effect
        (and
                (tiene ?e ?a)
                (not (loc_enfermo ?e ?u))
        )
)


(:action Dejar
:parameters     (?a - ambulancia ?e - enfermo ?u - localizacion)
:precondition
        (and
                (loc ?a ?u)
        (puededejar ?a)
                (tiene ?e ?a)
        )
:effect
        (and
                (loc_enfermo ?e ?u)
                (not (tiene ?e ?a))
        )
)


)
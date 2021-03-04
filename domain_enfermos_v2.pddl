(define (domain ProblemaPacientes2)
(:requirements :typing)
(:types
        agent sample localizacion enfermo hospital - object
        ambulancia  - agent
        enfermocovid enfermogripe - enfermo)

(:predicates (loc ?a - ambulancia ?u - localizacion)
             (link ?a - ambulancia ?u - localizacion ?w - localizacion) ; hay un link entre la localizacion u y la w con la ambulancia a
             (tiene ?e - enfermo ?a - ambulancia) ; la ambulancia a tiene un enfermo e
             (loc_enfermo ?e - enfermo ?u - localizacion)  ; hay enfermo en la localizacion u
             (llena ?a - ambulancia) ; la ambulancia a esta llena
             (puede_recoger ?a - ambulancia)
             (puede_dejar ?a - ambulancia)

             (hay_hospital ?u - localizacion) ; hay hospital en la localizacion u
             (enfermo_ingresado ?e - enfermo) ; el enfermo e esta ingresado

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
                (puede_recoger ?a)
                (loc_enfermo ?e ?u)
                (not (llena ?a))
        )
:effect
        (and
                (llena ?a)
                (tiene ?e ?a)
                (not (loc_enfermo ?e ?u))
        )
)


(:action Dejar
:parameters     (?a - ambulancia ?e - enfermo ?u - localizacion)
:precondition
        (and
                (loc ?a ?u)
                (puede_dejar ?a)
                (tiene ?e ?a)
                (llena ?a)
                (not (hay_hospital ?u))
        )
:effect
        (and
                (not (llena ?a))
                (loc_enfermo ?e ?u)
                (not (tiene ?e ?a))
        )
)

(:action Ingresar
:parameters     (?a - ambulancia ?e - enfermo ?u - localizacion)
:precondition
        (and
                (loc ?a ?u)
                (puede_dejar ?a)
                (tiene ?e ?a)
                (llena ?a)
                (hay_hospital ?u)
        )
:effect
        (and
                (not (llena ?a))
                (loc_enfermo ?e ?u)
                (not (tiene ?e ?a))
                (enfermo_ingresado ?e)
        )
)


)
(define (domain ProblemaPacientes4)
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
;;;;;;;;;;;;;   Acciones de las Ambulancias   ;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(:action Conducen_las_dos_ambulancias

:parameters     (?a - ambulancia ?u - localizacion ?w - localizacion ?b - ambulancia ?x - localizacion ?y - localizacion)
:precondition
        (and
                (link ?a ?u ?w)
                (loc ?a ?u)
                (link ?b ?x ?y)
                (loc ?b ?x)
        )
:effect
        (and
                (loc ?a ?w)
                (not (loc ?a ?u))
                (loc ?a ?w)
                (not (loc ?a ?u))
        )
)


(:action Recogen_las_dos_ambulancias
:parameters     (?a - ambulancia ?e - enfermo ?u - localizacion ?b - ambulancia ?f - enfermo ?x - localizacion)
:precondition
        (and
                (loc ?a ?u)
                (puede_recoger ?a)
                (loc_enfermo ?e ?u)
                (not (llena ?a))
                (loc ?b ?x)
                (puede_recoger ?b)
                (loc_enfermo ?f ?x)
                (not (llena ?b))
        )
:effect
        (and
                (llena ?a)
                (tiene ?e ?a)
                (not (loc_enfermo ?e ?u))
                (llena ?b)
                (tiene ?f ?b)
                (not (loc_enfermo ?f ?x))
        )
)

(:action Dejan_las_dos_ambulancias
:parameters     (?a - ambulancia ?e - enfermo ?u - localizacion ?b - ambulancia ?f - enfermo ?x - localizacion)
:precondition
        (and
                (loc ?a ?u)
                (puede_dejar ?a)
                (tiene ?e ?a)
                (llena ?a)
                (not (hay_hospital ?u))
                (loc ?b ?x)
                (puede_dejar ?b)
                (tiene ?f ?b)
                (llena ?b)
                (not (hay_hospital ?b))
        )
:effect
        (and
                (not (llena ?a))
                (loc_enfermo ?e ?u)
                (not (tiene ?e ?a))
                (not (llena ?b))
                (loc_enfermo ?f ?x)
                (not (tiene ?f ?b))
        )
)


(:action Ingresan_las_dos_ambulancias
:parameters     (?a - ambulancia ?e - enfermo ?u - localizacion ?b - ambulancia ?f - enfermo ?x - localizacion)
:precondition
        (and
                (loc ?a ?u)
                (puede_dejar ?a)
                (tiene ?e ?a)
                (llena ?a)
                (hay_hospital ?u)
                (loc ?b ?x)
                (puede_dejar ?b)
                (tiene ?f ?b)
                (llena ?b)
                (hay_hospital ?x)
        )
:effect
        (and
                (not (llena ?a))
                (loc_enfermo ?e ?u)
                (not (tiene ?e ?a))
                (enfermo_ingresado ?e)
                (not (llena ?b))
                (loc_enfermo ?f ?x)
                (not (tiene ?f ?b))
                (enfermo_ingresado ?f)
        )
)


(:action Una_conduce_y_otra_recoge
:parameters     (?a - ambulancia ?u - localizacion ?w - localizacion ?b - ambulancia ?f - enfermo ?x - localizacion)
:precondition
        (and
                (link ?a ?u ?w)
                (loc ?a ?u)
                (loc ?b ?x)
                (puede_recoger ?b)
                (loc_enfermo ?f ?x)
                (not (llena ?b))
        )
:effect
        (and
                (loc ?a ?w)
                (not (loc ?a ?u))
                (llena ?b)
                (tiene ?f ?b)
                (not (loc_enfermo ?f ?x))
        )
)

(:action Una_conduce_y_otra_deja
:parameters     (?a - ambulancia ?u - localizacion ?w - localizacion ?b - ambulancia ?f - enfermo ?x - localizacion)
:precondition
        (and
                (link ?a ?u ?w)
                (loc ?a ?u)
                (loc ?b ?x)
                (puede_dejar ?b)
                (tiene ?f ?b)
                (llena ?b)
                (not (hay_hospital ?b))
        )
:effect
        (and
                (loc ?a ?w)
                (not (loc ?a ?u))
                (not (llena ?b))
                (loc_enfermo ?f ?x)
                (not (tiene ?f ?b))
        )
)

(:action Una_conduce_y_otra_ingresa
:parameters     (?a - ambulancia ?u - localizacion ?w - localizacion ?b - ambulancia ?f - enfermo ?x - localizacion)
:precondition
        (and
                (link ?a ?u ?w)
                (loc ?a ?u)
                (loc ?b ?x)
                (puede_dejar ?b)
                (tiene ?f ?b)
                (llena ?b)
                (hay_hospital ?b)
        )
:effect
        (and
                (loc ?a ?w)
                (not (loc ?a ?u))
                (not (llena ?b))
                (loc_enfermo ?f ?x)
                (not (tiene ?f ?b))
                (enfermo_ingresado ?f)
        )
)


(:action Una_recoge_y_otra_deja
:parameters     (?a - ambulancia ?e - enfermo ?u - localizacion ?b - ambulancia ?f - enfermo ?x - localizacion)
:precondition
        (and
                (loc ?a ?u)
                (puede_recoger ?a)
                (loc_enfermo ?e ?u)
                (not (llena ?a))
                (loc ?b ?x)
                (puede_dejar ?b)
                (tiene ?f ?b)
                (llena ?b)
                (not (hay_hospital ?b))
        )
:effect
        (and
                (llena ?a)
                (tiene ?e ?a)
                (not (loc_enfermo ?e ?u))
                (not (llena ?b))
                (loc_enfermo ?f ?x)
                (not (tiene ?f ?b))
        )
)

(:action Una_recoge_y_otra_ingresa
:parameters     (?a - ambulancia ?e - enfermo ?u - localizacion ?b - ambulancia ?f - enfermo ?x - localizacion)
:precondition
        (and
                (loc ?a ?u)
                (puede_recoger ?a)
                (loc_enfermo ?e ?u)
                (not (llena ?a))
                (loc ?b ?x)
                (puede_dejar ?b)
                (tiene ?f ?b)
                (llena ?b)
                (hay_hospital ?b)
        )
:effect
        (and
                (llena ?a)
                (tiene ?e ?a)
                (not (loc_enfermo ?e ?u))
                (not (llena ?b))
                (loc_enfermo ?f ?x)
                (not (tiene ?f ?b))
                (enfermo_ingresado ?f)
        )
)


(:action Una_deja_y_otra_ingresa
:parameters     (?a - ambulancia ?e - enfermo ?u - localizacion ?b - ambulancia ?f - enfermo ?x - localizacion)
:precondition
        (and
                (loc ?a ?u)
                (puede_dejar ?a)
                (tiene ?e ?a)
                (llena ?a)
                (loc ?b ?x)
                (puede_dejar ?b)
                (tiene ?f ?b)
                (llena ?b)
                (hay_hospital ?b)
        )
:effect
        (and
                (not (llena ?a))
                (loc_enfermo ?e ?u)
                (not (tiene ?e ?a))
                (not (llena ?b))
                (loc_enfermo ?f ?x)
                (not (tiene ?f ?b))
                (enfermo_ingresado ?f)
        )
)

)

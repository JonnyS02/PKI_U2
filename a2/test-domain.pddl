;Header and description

(define (domain test)

    ;remove requirements that are not needed
    (:requirements :strips :fluents :negative-preconditions)

    (:types
        location - object
    )

    (:functions
        (count)
        (time-to-walk ?l1 - location)
    )

    (:action Hello_World
        :parameters (?t - location)
        :precondition (and(not(=(time-to-walk ?t)(count))))

        :effect (and(increase (count) 1)
            (decrease (time-to-walk ?t) 1))

    )

)
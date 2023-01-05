;Header and description

(define (domain test)

    ;remove requirements that are not needed
    (:requirements :strips :fluents :negative-preconditions)

    (:types
        multiplier
    )

    (:functions
        (value ?m - multiplier)

        (count)
        (cost)
    )

    (:action low_cost
        :parameters (?m - multiplier)
        :effect (and
            (increase (count) 1)
            (increase (cost) (*(value ?m)10))
            (assign (value ?m) 0)
        )
    )
    (:action high_cost
        :parameters (?m - multiplier)
        :effect (and
            (increase (count) 1)
            (increase (cost) (*(value ?m)5))
        )
    )
)
(define (problem test-problem)
    (:domain test)

    (:objects
        a - multiplier
    )
    (:init
        (=(value a)3)

        (=(count)0)
        (=(cost)0)

    )
    (:goal
        (=(count)3)
    )
    (:metric minimize
        (cost)
    )
)
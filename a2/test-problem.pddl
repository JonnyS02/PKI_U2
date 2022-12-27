(define (problem test-problem)
    (:domain test)

    (:objects
        test test2 - location
    )
    (:init
        (=(count)0)
        (=(time-to-walk test) 6)
        (=(time-to-walk test2) 6)
    )
    (:goal
        (=(time-to-walk test) 0)
        (=(count)6)
    )
)
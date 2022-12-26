(define (problem transport-problem)
    (:domain transport)
    (:objects
        Meyer Berger Schmitz - mitarbeiter
        truck1 truck2 - lastwagen
        w1 w2 w3 w4 w5 - warenhaus
        Spandau Pankow Lichtenberg Neukoelln - ort
        p1 p2 p3 p4 p5 p6 p7 p8 - ware
    )
    (:init
        (at Meyer w1)
        (at Berger w1)
        (at Schmitz w1)

        (at truck1 w1)
        (at truck2 w1)

        (at p1 w1)
        (at p2 w1)
        (at p3 w1)
        (at p4 w1)
        (at p5 w1)
        (at p6 w1)
        (at p7 w1)
        (at p8 w1)
    )
    (:goal
        (and (at p1 w2)
            (at p3 w2)
            (at p4 w2)
            (at p5 w2)
            (at p7 w3)
            (at p2 w4)
            (at p6 w4)
            (at p8 w4))
    )
)
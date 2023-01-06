
(define (problem a_problem)
    (:domain a_domain)
    (:objects
        PARCEL1 PARCEL2 PARCEL3 PARCEL4 PARCEL5 PARCEL6 PARCEL7 PARCEL8 - parcel
        WAREHOUSE1 WAREHOUSE2 WAREHOUSE3 WAREHOUSE4 WAREHOUSE5 - warehouse
        TRUCK1 TRUCK2 - truck
        BERGER SCHMITZ - staff
        SPANDAU PANKOW LICHTENBERG NEUKOELLN - location
    )

    (:init
        (=(anzahl)0)
        (at WAREHOUSE1 SPANDAU)
        (at WAREHOUSE2 LICHTENBERG)
        (at WAREHOUSE3 PANKOW)
        (at WAREHOUSE4 NEUKOELLN)
        (at WAREHOUSE5 NEUKOELLN)

        (at TRUCK1 SPANDAU)
        (at TRUCK2 SPANDAU)

        (at BERGER SPANDAU)
        (at SCHMITZ SPANDAU)

        (hasDrivingLicence BERGER)
        (hasDrivingLicence SCHMITZ)

        (parcel_in_warehouse PARCEL1 WAREHOUSE1)
        (parcel_in_warehouse PARCEL2 WAREHOUSE1)
        (parcel_in_warehouse PARCEL3 WAREHOUSE1)
        (parcel_in_warehouse PARCEL4 WAREHOUSE1)
        (parcel_in_warehouse PARCEL5 WAREHOUSE1)
        (parcel_in_warehouse PARCEL6 WAREHOUSE1)
        (parcel_in_warehouse PARCEL7 WAREHOUSE1)
        (parcel_in_warehouse PARCEL8 WAREHOUSE1)

            (hasGoal PARCEL1 WAREHOUSE2)
            (hasGoal PARCEL3 WAREHOUSE2)
            (hasGoal PARCEL4 WAREHOUSE2)
            (hasGoal PARCEL5 WAREHOUSE2)
            (hasGoal PARCEL7 WAREHOUSE3)
            (hasGoal PARCEL2 WAREHOUSE4)
            (hasGoal PARCEL6 WAREHOUSE4)
            (hasGoal PARCEL8 WAREHOUSE4)

    )

    (:goal
        (and
            
            (parcel_in_warehouse PARCEL1 WAREHOUSE2)
            (parcel_in_warehouse PARCEL3 WAREHOUSE2)
            (parcel_in_warehouse PARCEL4 WAREHOUSE2)
            (parcel_in_warehouse PARCEL5 WAREHOUSE2)
            (parcel_in_warehouse PARCEL7 WAREHOUSE3)
            (parcel_in_warehouse PARCEL2 WAREHOUSE4)
            (parcel_in_warehouse PARCEL6 WAREHOUSE4)
            (parcel_in_warehouse PARCEL8 WAREHOUSE4)
        )
    )

    (:metric minimize (anzahl))

)
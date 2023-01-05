
(define (problem problem_Sunshine_Logistics)
    (:domain domain_Sunshine_Logistics)
    (:objects
        PARCEL1 PARCEL2 PARCEL3 - parcel
        WAREHOUSE1 WAREHOUSE2 WAREHOUSE3 - warehouse
        TRUCK1 - truck
        BERGER - staff
        SPANDAU LICHTENBERG BRANDENBURG - location
    )

    (:init
        (=(kilometers_travelled TRUCK1)0)
        (=(travel_duration)30)
        (=(hours_of_work Berger)0)
        (=(distance_from_spandau_to_location LICHTENBERG)0)
        (=(distance_from_spandau_to_location BRANDENBURG)0)

        (at WAREHOUSE1 SPANDAU)
        (at WAREHOUSE2 LICHTENBERG)
        (at WAREHOUSE2 BRANDENBURG)

        (at TRUCK1 SPANDAU)

        (at BERGER SPANDAU)

        (hasDrivingLicence BERGER)

        (parcel_in_warehouse PARCEL1 WAREHOUSE1)
        (parcel_in_warehouse PARCEL2 WAREHOUSE1)
        (parcel_in_warehouse PARCEL3 WAREHOUSE1)

    )

    (:goal
        (and
            (parcel_in_warehouse PARCEL1 WAREHOUSE2)
            (parcel_in_warehouse PARCEL2 WAREHOUSE2)
            ;(parcel_in_warehouse PARCEL3 WAREHOUSE3)
            (at TRUCK1 SPANDAU)
            (at BERGER SPANDAU)
        )
    )

)
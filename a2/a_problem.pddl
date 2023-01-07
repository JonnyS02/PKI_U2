
(define (problem a_problem)
    (:domain a_domain)
    (:objects
        Parcel1 Parcel2 Parcel3 Parcel4 Parcel5 Parcel6 Parcel7 Parcel8 - parcel
        Warehouse1 Warehouse2 Warehouse3 Warehouse4 Warehouse5 - warehouse
        Truck1 Truck2 - truck
        Fischer Berger Schmitz Meyer - staff
        Spandau Pankow Lichtenberg Neukoellen - location
    )

    (:init
        (=(total_work_hours)0)
        (=(hours_of_work Fischer)0)
        (=(hours_of_work Berger)0)
        (=(hours_of_work Schmitz)0)
        (=(hours_of_work Meyer)0)

        (at Warehouse1 Spandau)
        (at Warehouse2 Lichtenberg)
        (at Warehouse3 Pankow)
        (at Warehouse4 Neukoellen)
        (at Warehouse5 Neukoellen)

        (at Truck1 Spandau)
        (at Truck2 Spandau)

        (at Fischer Spandau)
        (at Berger Spandau)
        (at Schmitz Spandau)
        (at Meyer Spandau)

        (hasDrivingLicence Berger)
        (hasDrivingLicence Schmitz)
        (hasDrivingLicence Meyer)

        (parcel_in_warehouse Parcel1 Warehouse1)
        (parcel_in_warehouse Parcel2 Warehouse1)
        (parcel_in_warehouse Parcel3 Warehouse1)
        (parcel_in_warehouse Parcel4 Warehouse1)
        (parcel_in_warehouse Parcel5 Warehouse1)
        (parcel_in_warehouse Parcel6 Warehouse1)
        (parcel_in_warehouse Parcel7 Warehouse1)
        (parcel_in_warehouse Parcel8 Warehouse1)

    )

    (:goal
        (and
            (<=(hours_of_work Fischer)60)
            (<=(hours_of_work Berger)60)
            (<=(hours_of_work Schmitz)60)
            (<=(hours_of_work Meyer)60)

            (parcel_in_warehouse Parcel1 Warehouse2)
            (parcel_in_warehouse Parcel3 Warehouse2)
            (parcel_in_warehouse Parcel4 Warehouse2)
            (parcel_in_warehouse Parcel5 Warehouse2)
            (parcel_in_warehouse Parcel7 Warehouse3)
            (parcel_in_warehouse Parcel2 Warehouse4)
            (parcel_in_warehouse Parcel6 Warehouse4)
            (parcel_in_warehouse Parcel8 Warehouse4)
        )
    )
   ; (:metric minimize
   ;     (total_work_hours)
   ; )
)
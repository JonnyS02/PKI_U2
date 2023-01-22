(define (problem c_problem)

    (:domain c_domain)
    
    (:objects
        Parcel1 Parcel2 Parcel3 Parcel4 Parcel5 Parcel6 Parcel7 Parcel8 - parcel
        Warehouse2 Warehouse3 Warehouse4 Warehouse5 - warehouse
        Truck1 Truck2 - truck
        Fischer - staff
        Berger Schmitz Meyer - driver
        Spandau Pankow Lichtenberg Neukoellen - location
    )

    (:init
        (=(trips Truck1)0)
        (=(trips Truck2)0)

        (=(travel_duration)30)

        (at Fischer Warehouse1)
        (at Berger Warehouse1)
        (at Schmitz Warehouse1)
        (at Meyer Warehouse1)

        (=(minutes_of_work Fischer)0)
        (=(minutes_of_work Berger)0)
        (=(minutes_of_work Schmitz)0)
        (=(minutes_of_work Meyer)0)

        (at Truck1 Warehouse1)
        (at Truck2 Warehouse1)

        (at Warehouse1 Spandau)
        (at Warehouse2 Lichtenberg)
        (at Warehouse3 Pankow)
        (at Warehouse4 Neukoellen)
        (at Warehouse5 Neukoellen)

        (at Parcel1 Warehouse1)
        (at Parcel2 Warehouse1)
        (at Parcel3 Warehouse1)
        (at Parcel4 Warehouse1)
        (at Parcel5 Warehouse1)
        (at Parcel6 Warehouse1)
        (at Parcel7 Warehouse1)
        (at Parcel8 Warehouse1)

       (=(parcels_handled Fischer)-4)
       (=(parcels_handled Berger)0)
       (=(parcels_handled Schmitz)0)
       (=(parcels_handled Meyer)0)
    )

    (:goal
        (and
            (at Parcel1 Warehouse2)
            (at Parcel3 Warehouse2)
            (at Parcel4 Warehouse2)
            (at Parcel5 Warehouse2)

            (at Parcel7 Warehouse3)

            (at Parcel2 Warehouse4)
            (at Parcel6 Warehouse4)
            (at Parcel8 Warehouse4)
        )
    )
)
(define (problem a-b_problem)

    (:domain a-b_domain)
    
    (:objects
        Parcel1 Parcel2 Parcel3 Parcel4 Parcel5 Parcel6 Parcel7 Parcel8 - parcel
        Warehouse2 Warehouse3 Warehouse4 Warehouse5 - warehouse
        Truck1 Truck2  - truck
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

        (=(kilometers_travelled Truck1)14725)
        (=(kilometers_travelled Truck2)14690)

        (at Warehouse1 Spandau)
        (at Warehouse2 Lichtenberg)
        (at Warehouse3 Pankow)
        (at Warehouse4 Neukoellen)
        (at Warehouse5 Neukoellen)

        (=(distance_to_spandau Pankow)15)
        (=(distance_to_spandau Lichtenberg)26)
        (=(distance_to_spandau Neukoellen)25)

        (parcel_in_warehouse Parcel1 Warehouse1)
        (parcel_in_warehouse Parcel2 Warehouse1)
        (parcel_in_warehouse Parcel3 Warehouse1)
        (parcel_in_warehouse Parcel4 Warehouse1)
        (parcel_in_warehouse Parcel5 Warehouse1)
        (parcel_in_warehouse Parcel6 Warehouse1)
        (parcel_in_warehouse Parcel7 Warehouse1)
        (parcel_in_warehouse Parcel8 Warehouse1)
        (=(total_work)0)
    )

    (:goal
        (and
            ;(>=(minutes_of_work Fischer)(/(total_work)4)) OOM
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
   ;(:metric maximize (kilometers_travelled Truck1)) OOM
   ;(:metric minimize (+(kilometers_travelled Truck1)(kilometers_travelled Truck2)) OOM
   ;(:metric minimize (+(minutes_of_work Meyer)(+(minutes_of_work Berger)(minutes_of_work Schmitz)))) Keine Verbesserung am Ergebnis
)
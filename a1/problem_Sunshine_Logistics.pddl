
(define (problem problem_Sunshine_Logistics) (:domain domain_Sunshine_Logistics)
(:objects 
    PARCEL1 PARCEL2 PARCEL3 PARCEL4 PARCEL5 PARCEL6 PARCEL7 PARCEL8 - parcel
    WAREHOUSE1 WAREHOUSE2 WAREHOUSE3 WAREHOUSE4 WAREHOUSE5 - warehouse
    TRUCK1 TRUCK2 - truck
    BERGER SCHMITZ MEYER FISCHER - staff 
    SPANDAU PANKOW LICHTENBERG NEUKOELLN - location
)   

(:init
    ;todo: put the initial state's facts and numeric values here
    
    (= (distance_from_spandau_to_location PANKOW) 15)
    (= (distance_from_spandau_to_location LICHTENBERG) 26)
    (= (distance_from_spandau_to_location NEUKOELLN) 25)

    (= (kilometers_travelled TRUCK1) 0)
    (= (kilometers_travelled TRUCK2) 0)

    (= (hours_of_work BERGER )0)
    (= (hours_of_work SCHMITZ )0)
    (= (hours_of_work MEYER )0)
    (= (hours_of_work FISCHER )0)

    (=(travel_duration) 30)
    
    (at WAREHOUSE1 SPANDAU)
    (at WAREHOUSE2 LICHTENBERG)
    (at WAREHOUSE3 PANKOW)
    (at WAREHOUSE4 NEUKOELLN)
    (at WAREHOUSE5 NEUKOELLN)

    (at TRUCK1 SPANDAU)
    (at TRUCK2 SPANDAU)

    (at BERGER  SPANDAU)
    (at SCHMITZ SPANDAU)
    (at MEYER SPANDAU)
    (at FISCHER SPANDAU)

    (hasDrivingLicence MEYER)
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

)

(:goal (and
    ;todo: put the goal condition here
    (parcel_in_warehouse PARCEL1 WAREHOUSE2)
    (parcel_in_warehouse PARCEL3 WAREHOUSE2)
    (parcel_in_warehouse PARCEL4 WAREHOUSE2)
    (parcel_in_warehouse PARCEL5 WAREHOUSE2)
    (parcel_in_warehouse PARCEL7 WAREHOUSE3)
    (parcel_in_warehouse PARCEL2 WAREHOUSE4)
    (parcel_in_warehouse PARCEL6 WAREHOUSE4)
    (parcel_in_warehouse PARCEL8 WAREHOUSE4)
   

))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)





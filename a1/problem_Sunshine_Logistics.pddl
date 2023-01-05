
(define (problem problem_Sunshine_Logistics) (:domain domain_Sunshine_Logistics)
(:objects 
    PARCEL1 PARCEL2 PARCEL3 PARCEL4 PARCEL5 PARCEL6 PARCEL7 PARCEL8 - parcel
    WAREHOUSE1 WAREHOUSE2 WAREHOUSE3 WAREHOUSE4 WAREHOUSE5 - warehouse
    TRUCk1 TRUCK2 - truck
    BERGER SCHMITZ MEYER - driver
    FISCHER - boss
    SPANDAU PANKOW LICHTENBERG NEUKOELLN - location
)   

(:init
    ;todo: put the initial state's facts and numeric values here
    
    (= (distance_from_spandau_to_location PANKOW) 15)
    (= (distance_from_spandau_to_location LICHTENBERG) 26)
    (= (distance_from_spandau_to_location NEUKOELLN) 25)
    
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


    (at PARCEL1 WAREHOUSE1)
    (at PARCEL2 WAREHOUSE1)
    (at PARCEL3 WAREHOUSE1)
    (at PARCEL4 WAREHOUSE1)
    (at PARCEL5 WAREHOUSE1)
    (at PARCEL6 WAREHOUSE1)
    (at PARCEL7 WAREHOUSE1)
    (at PARCEL8 WAREHOUSE1)

)

(:goal (and
    ;todo: put the goal condition here
    (at PARCEL1 WAREHOUSE2)
    (at PARCEL3 WAREHOUSE2)
    (at PARCEL4 WAREHOUSE2)
    (at PARCEL5 WAREHOUSE2)
    (at PARCEL7 WAREHOUSE3)
    (at PARCEL2 WAREHOUSE4)
    (at PARCEL6 WAREHOUSE4)
    (at PARCEL8 WAREHOUSE4)
   

))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)





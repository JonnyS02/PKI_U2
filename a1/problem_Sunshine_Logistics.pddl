(define (problem problem_Sunshine_Logistics) (:domain domain_Sunshine_Logistics)
(:objects 
    PARCEL1 PARCEL2 PARCEL3 PARCEL4 PARCEL5 PARCEL6 PARCEL7 PARCEL8 - parcel
    WAREHOUSE1 WAREHOUSE2 WAREHOUSE3 WAREHOUSE4 WAREHOUSE5 - warehouse
    TRUCk1 TRUCK2 - truck
    BERGER SCHMITZ MEYER - driver
    FISCHER - boss
    SPANDAU PANKOW LICHTENBERG NEUKOELLN - location
    SPANDAU_PANKOW SPANDAU_LICHTENBERG SPANDAU_NEUKOELLN - road
)   

(:init
    ;todo: put the initial state's facts and numeric values here
    (warehouseAt WAREHOUSE1 SPANDAU)
    (warehouseAt WAREHOUSE2 LICHTENBERG)
    (warehouseAt WAREHOUSE3 PANKOW)
    (warehouseAt WAREHOUSE4 NEUKOELLN)
    (warehouseAt WAREHOUSE5 NEUKOELLN)

    (= (distance SPANDAU PANKOW ) 15)
    (= (distance SPANDAU_LICHTENBERG )25)
    (= (distance SPANDAU_NEUKOELLN ) 26)

    (= (time SPANDAU PANKOW ) 30)
    (= (time  SPANDAU_LICHTENBERG )30)
    (= (time  SPANDAU_NEUKOELLN ) 30)

    (truckAt TRUCK1 SPANDAU)
    (truckAt TRUCK2 SPANDAU)

    (staffAt BERGER  SPANDAU)
    (staffAt SCHMITZ SPANDAU)
    (staffAt MEYER SPANDAU)
    (staffAt FISCHER SPANDAU)

    (parcelAt PARCEL1 WAREHOUSE1)
    (parcelAt PARCEL2 WAREHOUSE1)
    (parcelAt PARCEL3 WAREHOUSE1)
    (parcelAt PARCEL4 WAREHOUSE1)
    (parcelAt PARCEL5 WAREHOUSE1)
    (parcelAt PARCEL6 WAREHOUSE1)
    (parcelAt PARCEL7 WAREHOUSE1)
    (parcelAt PARCEL8 WAREHOUSE1)

)

(:goal (and
    ;todo: put the goal condition here
    (parcelAt PARCEL1 WAREHOUSE2)
    (parcelAt PARCEL3 WAREHOUSE2)
    (parcelAt PARCEL4 WAREHOUSE2)
    (parcelAt PARCEL5 WAREHOUSE2)
    (parcelAt PARCEL7 WAREHOUSE3)
    (parcelAt PARCEL2 WAREHOUSE4)
    (parcelAt PARCEL6 WAREHOUSE4)
    (parcelAt PARCEL8 WAREHOUSE4)
   

))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)

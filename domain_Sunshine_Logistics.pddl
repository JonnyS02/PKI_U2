;Header and description

(define (domain domain_Sunshine_Logistics)

;remove requirements that are not needed
(:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

(:types 
    warehouse
    truck
    boss driver - staff
    road
    location
    parcel
    hours
    kilometers
    ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
    (warehouseAt ?w - warehouse ?l - location)
    ;warehouse w is located at location l
    (parcelAt ?p - parcel ?l - location)
    ;parcel p is located at location l
    (truckAt ?t - truck ? l - location)
    ;truck t is located at location l
    (parcelIn ?p - parcel ?t - truck)
    ;parcel p is located in the truck t
    (staffAt ?d - driver ?l - location)
    ;driver d is at the location l
    (hasDrivingLicence ?s - staff)
    ;staff s has truck driving licence
    (hoursOfWork ?s - staff ?h - hours)
    ;Number of working hours of an employee
    (kilometerage ?t - truck  ?k - kilometers)
    ;kilometerage of a truck
    (truckOn ?t - truck ?r - road)
    ;the road the truck is driving on 
)


(:functions ;todo: define numeric functions here
    (distance ?r - road) 
    ; Distance between two locations in km
    (time ?r - road) 
    ;travel time between two locations
)

;define actions here
(:action drive ; this action is only for picking from table
		:parameters (?t - truck ?r - road)
		:precondition (and
		
		)
		:effect (and
			
		)
	)

)

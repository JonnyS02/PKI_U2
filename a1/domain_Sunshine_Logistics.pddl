;Header and description

(define (domain domain_Sunshine_Logistics)

;remove requirements that are not needed
;(:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)
(:requirements :strips :fluents :typing  :negative-preconditions)

(:types 
	staff
    warehouse
    truck
    location
    parcel
    ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
    (at ?o - object ?l - location)
	;is the parcel/truck/staff/warehouse at the location
    (parcel_in_truck ?p - parcel ?t - truck)
    ;parcel p is located in the truck t
	(parcel_in_warehouse ?p - parcel ?w - warehouse)
    ;parcel p is locatedin the warehouse w
	(staff_at_warehouse ?s - staff ?w - warehouse)
	;staff s is at the warehouse w
	(staff_in_truck ?s - staff ?t - truck)
	;staff s is at the warehouse w
    (hasDrivingLicence ?s - staff)
	;staff s has truck driving licence
)

(:functions ;todo: define numeric functions here
	(hours_of_work ?s - staff)
	;hours of work of a staff s
	(kilometers_travelled ?t - truck) 
	;the current kilometer of the truck
	(travel_duration)
	;the travel duration between spandau and other locations
	(distance_from_spandau_to_location ?l - location)
	;the distance between spandau and a location l

)

;do we need an action to transport parcel from warehouse to truck? 

(:action load  
		:parameters (?t - truck ?p - parcel ?from - location ?to - location ?s - staff ?w - warehouse)
		:precondition (and
		 (at ?t ?from) (at ?p ?from) (at ?s ?from) (parcel_in_warehouse ?p ?w )
		)
		:effect (and
		 (not(parcel_in_warehouse ?p ?w )) (parcel_in_truck ?p ?t) (staff_in_truck ?s ?t)
		 (increase (hours_of_work ?s) 1)
		 ;we assume that load and unload takes 1 time unit
		)
	)

(:action transport
		:parameters (?s - staff ?t - truck ?p - parcel ?from - location ?to - location ?w - warehouse)
		:precondition (and
		    (at ?s ?from) (at ?p ?from) (at ?t ?from) (hasDrivingLicence ?s)
		    (parcel_in_truck ?p ?t) (not(staff_in_truck ?s ?t))
		)
		:effect (and
		    (at ?s ?to) (at ?p ?to) (at ?t ?to) (not (at ?s ?from))(not (at ?p ?from))(not (at ?t ?from)) (parcel_in_truck ?p ?t)
		    (staff_in_truck ?s ?t)
		    (increase (hours_of_work ?s) (travel_duration))
		    (increase (kilometers_travelled ?t) (distance_from_spandau_to_location ?to))
		    ;instead of 1 a function that gives the distance between spandau and the location the truck is going to 
		    )
	)
(:action unload ; 
		:parameters (?t - truck ?p - parcel ?from - location ?to - location ?s - staff ?w - warehouse)
		:precondition (and
		 (at ?t ?to) (at ?p ?to) (at ?s ?to) (parcel_in_truck ?p ?t) (staff_in_truck ?s ?t)
		)
		:effect (and
		 (not(parcel_in_truck ?p ?t)) (not(staff_in_truck ?s ?t)) (parcel_in_warehouse ?p ?w) (staff_in_truck ?s ?t)
		 (increase (hours_of_work ?s) 1)
		)
	)

(:action return ; 
		:parameters (?s - staff ?t - truck ?p - parcel ?from - location ?to - location)
		:precondition (and
		    (at ?s ?to) (at ?t ?to) (not(parcel_in_truck ?p ?t)) (staff_in_truck) (hasDrivingLicence ?s)
		)
		:effect (and
		     (at ?s ?from) (at ?t ?from) (not (at ?s ?to))(not (at ?t ?to))
		    
			
		)
	)
)


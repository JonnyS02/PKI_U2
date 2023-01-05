;Header and description

(define (domain domain_Sunshine_Logistics)

	(:requirements :strips :fluents :typing :negative-preconditions)

	(:types
		staff warehouse truck location parcel
	)

	(:predicates
		(at ?o - object ?l - location)
		(parcel_in_truck ?p - parcel ?t - truck)
		(parcel_in_warehouse ?p - parcel ?w - warehouse)
		(staff_at_warehouse ?s - staff ?w - warehouse)
		(staff_in_truck ?s - staff ?t - truck)
		(hasDrivingLicence ?s - staff)
	)

	(:functions
		(hours_of_work ?s - staff)
		(kilometers_travelled ?t - truck)
		(travel_duration)
		(distance_from_spandau_to_location ?l - location)
	)

	(:action load
		:parameters (?t - truck ?p - parcel ?from - location ?to - location ?s - staff ?w - warehouse)
		:precondition (and
			(at ?t ?from)
			(at ?s ?from)
			(at ?w ?from)
			(parcel_in_warehouse ?p ?w)
			(not(staff_in_truck ?s ?t))
		)
		:effect (and
			(not(parcel_in_warehouse ?p ?w))
			(parcel_in_truck ?p ?t)
			(increase (hours_of_work ?s) 1)
		)
	)

	(:action transport
		:parameters (?s - staff ?t - truck ?p - parcel ?from - location ?to - location)
		:precondition (and
			(at ?s ?from)
			(at ?t ?from)
			(hasDrivingLicence ?s)
			(parcel_in_truck ?p ?t)
		)
		:effect (and
			(staff_in_truck ?s ?t)
			(at ?s ?to)
			(at ?p ?to)
			(at ?t ?to)
			(not (at ?s ?from))
			(not (at ?p ?from))
			(not (at ?t ?from))
			(increase (hours_of_work ?s) (travel_duration))
			(increase
				(kilometers_travelled ?t)
				(distance_from_spandau_to_location ?to))
		)
	)

	(:action unload
		:parameters (?s - staff ?t - truck ?p - parcel ?l - location ?w - warehouse)
		:precondition (and
			(parcel_in_truck ?p ?t)
			(at ?t ?l)
			(at ?s ?l)
			(at ?w ?l)
		)
		:effect (and
			(parcel_in_warehouse ?p ?w)
			(not(parcel_in_truck ?p ?t))
		)
	)

	(:action return ; 
		:parameters (?s - staff ?t - truck ?p - parcel ?from - location ?to - location)
		:precondition (and
			(at ?s ?to) 
			(at ?t ?to) 
			(not(parcel_in_truck ?p ?t)) 
			(staff_in_truck ?s ?t) 
			(hasDrivingLicence ?s)
		)
		:effect (and
			(at ?s ?from) 
			(at ?t ?from) 
			(not (at ?s ?to))
			(not (at ?t ?to))
			(not (staff_in_truck ?s ?t))

		)
	)

)
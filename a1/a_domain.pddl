;Header and description

(define (domain a_domain)

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
		(going_home ?t - truck)
		(hasGoal ?p - parcel ?w - warehouse)
		(warehouse_checked ?w - warehouse)
		(current_warehouse ?w - warehouse)
	)

	(:functions
		(anzahl)
		(hours_of_work ?s - staff)
		(kilometers_travelled ?t - truck)
		(travel_duration)
		(distance_from_spandau_to_location ?l - location)
	)

	(:action planing
		:parameters (?w - warehouse ?oldw - warehouse)
		:precondition (and
			(current_warehouse ?oldw)
			(not(= ?w WAREHOUSE1))
			(not(warehouse_checked ?w))
		)
		:effect (and
			(warehouse_checked ?w)
			(current_warehouse ?w)
			(not(current_warehouse ?oldw))

		)
	)

	(:action load
		:parameters (?t - truck ?s - staff ?w - warehouse ?from - location ?p - parcel ?wto - warehouse)
		:precondition (and
			(= ?from SPANDAU)
			(hasGoal ?p ?wto)
			(current_warehouse ?wto)
			(at ?t ?from)
			(at ?s ?from)
			(at ?w ?from)
		)
		:effect (and
			(not(parcel_in_warehouse ?p ?w))
			(parcel_in_truck ?p ?t))
	)

	(:action transport
		:parameters (?s - staff ?t - truck ?p - parcel ?from - location ?to - location)
		:precondition (and
			(not(going_home ?t))
			(not(at WAREHOUSE1 ?to))
			(not(= ?from ?to))
			(at ?s ?from)
			(at ?t ?from)
			(hasDrivingLicence ?s)
			(parcel_in_truck ?p ?t)
		)
		:effect (and

			(increase (anzahl) 1)
			(at ?s ?to)
			(at ?t ?to)
			(not (at ?s ?from))
			(not (at ?t ?from))
		)
	)
	(:action unload
		:parameters (?s - staff ?t - truck ?p - parcel ?l - location ?w - warehouse)
		:precondition (and
			;(not(= ?l SPANDAU))
			(parcel_in_truck ?p ?t)
			(at ?t ?l)
			(at ?s ?l)
			(at ?w ?l)
		)
		:effect (and
			(increase (anzahl) 1)
			(parcel_in_warehouse ?p ?w)
			(not(parcel_in_truck ?p ?t))
			(going_home ?t)
		)
	)
	(:action return ; 
		:parameters (?s - staff ?t - truck ?to - location)
		:precondition (and
			(going_home ?t)
			(at ?s ?to)
			(at ?t ?to)
			(forall(?p - parcel)
				(not(parcel_in_truck ?p ?t)))
			(hasDrivingLicence ?s)
		)
		:effect (and
			(not (going_home ?t))
			(at ?s SPANDAU)
			(at ?t SPANDAU)
			(not (at ?s ?to))
			(not (at ?t ?to))
		)
	)

)
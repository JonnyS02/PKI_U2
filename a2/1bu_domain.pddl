;Header and description

(define (domain bu_domain)

	(:requirements :strips :fluents :typing :negative-preconditions :equality)

	(:types
		staff warehouse truck location parcel - object
		driver - staff
	)

	(:predicates
		(at ?o - object ?l - location)
		(parcel_in_truck ?p - parcel ?t - truck)
		(parcel_in_warehouse ?p - parcel ?w - warehouse)
		(location_checked ?l - location)
	)

	(:functions
		(minutes_of_work ?s - staff)
		(kilometers_travelled ?t - truck)
		(travel_duration)
		(distance_to_spandau ?l - location)
	)

	(:action load
		:parameters (?t - truck ?s - staff ?p - parcel ?l - location ?w - warehouse)
		:precondition (and
			(=?s Fischer)
			(at ?t ?l)
			(at ?s ?l)
			(at ?w ?l)
			(parcel_in_warehouse ?p ?w)
		)
		:effect (and
			(increase (minutes_of_work ?s) 10)
			(not(parcel_in_warehouse ?p ?w))
			(parcel_in_truck ?p ?t))
	)

	(:action transport
		:parameters (?t - truck ?s - driver ?from - location ?to - location)
		:precondition (and
			(not(= ?from ?to))
			(not(location_checked ?to))
			(= ?from Spandau)
			(at ?s ?from)
			(at ?t ?from)
		)
		:effect (and
			(increase (kilometers_travelled ?t) (distance_to_spandau ?to))
			(increase (minutes_of_work ?s) (travel_duration))
			(location_checked ?to)
			(not (at ?s ?from))
			(not (at ?t ?from))
			(at ?s ?to)
			(at ?t ?to)
		)
	)
	(:action unload
		:parameters (?t - truck ?s - staff ?p - parcel ?l - location ?w - warehouse)
		:precondition (and
			(at ?t ?l)
			(at ?s ?l)
			(at ?w ?l)
			(not(= ?l Spandau))
			(parcel_in_truck ?p ?t)
		)
		:effect (and
			(increase (minutes_of_work ?s) 10)
			(parcel_in_warehouse ?p ?w)
			(not(parcel_in_truck ?p ?t))
		)
	)
	(:action return
		:parameters (?t - truck ?s - driver ?l - location)
		:precondition (and
			(at ?s ?l)
			(at ?t ?l)
			(not(= ?l Spandau))
			(forall(?p - parcel)
				(not(parcel_in_truck ?p ?t)))
		)
		:effect (and
			(increase (kilometers_travelled ?t) (distance_to_spandau ?l))
			(increase (minutes_of_work ?s) (travel_duration))
			(not (at ?s ?l))
			(not (at ?t ?l))
			(at ?s Spandau)
			(at ?t Spandau)
		)
	)

)
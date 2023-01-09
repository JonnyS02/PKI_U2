;Header and description

(define (domain a_domain)

	(:requirements :strips :fluents :typing :negative-preconditions :equality)

	(:types
		staff warehouse truck location parcel
		driver - staff
	)

	(:predicates
		(at ?o - object ?l - location)
		(parcel_in_truck ?p - parcel ?t - truck)
		(parcel_in_warehouse ?p - parcel ?w - warehouse)
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
			(forall (?st - staff)(<=(minutes_of_work ?s)(minutes_of_work ?st)) )
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
			(forall (?d - driver)(<=(minutes_of_work ?s)(minutes_of_work ?d)) )
			(exists (?p - parcel)(parcel_in_truck ?p ?t) )
			(at ?s ?from)
			(at ?t ?from)
		)
		:effect (and
			(increase (kilometers_travelled ?t) (distance_to_spandau ?to))
			(increase (minutes_of_work ?s) (travel_duration))
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
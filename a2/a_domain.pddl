;Header and description

(define (domain a_domain)

	(:requirements :strips :fluents :typing :negative-preconditions :equality)

	(:types
		staff warehouse truck location parcel
	)

	(:predicates
		(at ?o - object ?l - location)
		(parcel_in_truck ?p - parcel ?t - truck)
		(parcel_in_warehouse ?p - parcel ?w - warehouse)
		(hasDrivingLicence ?s - staff)
		(location_checked ?l - location)
	)

	(:functions
		(total_work_hours)
		(hours_of_work ?s - staff)
		(kilometers_travelled ?t - truck)
		(travel_duration)
		(distance_from_spandauSpandau_to_location ?l - location)
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
			(increase (hours_of_work ?s) 0)
			(increase (total_work_hours) 0)
			(not(parcel_in_warehouse ?p ?w))
			(parcel_in_truck ?p ?t))
	)

	(:action transport
		:parameters (?t - truck ?s - staff ?from - location ?to - location)
		:precondition (and
			(not(= ?from ?to))
			(not(location_checked ?to))
			(= ?from Spandau)
			(at ?s ?from)
			(at ?t ?from)
			(hasDrivingLicence ?s)
		)
		:effect (and
			(increase (total_work_hours) 30)
			(increase (hours_of_work ?s) 30)
			(location_checked ?to)
			(at ?s ?to)
			(at ?t ?to)
			(not (at ?s ?from))
			(not (at ?t ?from))
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
			(increase (hours_of_work ?s) 0)
			(increase (total_work_hours) 0)

			(parcel_in_warehouse ?p ?w)
			(not(parcel_in_truck ?p ?t))
		)
	)
	(:action return
		:parameters (?t - truck ?s - staff ?from - location)
		:precondition (and
			(at ?s ?from)
			(at ?t ?from)
			(not(= ?from Spandau))
			(forall(?p - parcel)
				(not(parcel_in_truck ?p ?t)))
			(hasDrivingLicence ?s)
		)
		:effect (and
			(increase (total_work_hours) 30)
			(increase (hours_of_work ?s) 30)

			(not (at ?s ?from))
			(not (at ?t ?from))
			(at ?s Spandau)
			(at ?t Spandau)
		)
	)

)
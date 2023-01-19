(define (domain c_domain)

	(:requirements :strips :fluents :typing :negative-preconditions :equality)

	(:types
		staff warehouse truck location parcel - object
		driver - staff
	)

	(:constants
		Warehouse1 - warehouse
	)

	(:predicates
		(at ?x - object ?y - object)
		(parcel_in_truck ?p - parcel ?t - truck)
		(parcel_in_warehouse ?p - parcel ?w - warehouse)
		(warehouse_checked ?w - warehouse)
	)

	(:functions
		(total_work)
		(trips ?t - truck)
		(minutes_of_work ?s - staff)
		(kilometers_travelled ?t - truck)
		(travel_duration)
		(distance_to_spandau ?l - location)
	)

	(:action load
		:parameters (?t - truck ?s - staff ?p - parcel ?w - warehouse)
		:precondition (and
			;(=?s Fischer) ;Für eine äußerst ausgewogene Auslastung, könnte man Fischer alle load-Aufgaben standardmäßig zuordnen (macht die Lösung natürlich weniger generisch)
			(forall(?st - staff)(<=(minutes_of_work ?s)(minutes_of_work ?st)))
			(at ?t ?w)
			(at ?s ?w)
			(parcel_in_warehouse ?p ?w)
		)
		:effect (and
			(increase (minutes_of_work ?s) 10)
			(increase (total_work) 10)
			(not(parcel_in_warehouse ?p ?w))
			(parcel_in_truck ?p ?t))
	)

	(:action transport_from_spandau
		:parameters (?t - truck ?s - driver  ?w - warehouse ?l - location)
		:precondition (and
			(forall(?d - driver)(<=(minutes_of_work ?s)(minutes_of_work ?d)))
			(forall(?tr - truck)(<=(trips ?t)(trips ?tr)))
			(not(= Warehouse1 ?w))
			(not(warehouse_checked ?w))
			(at ?s Warehouse1)
			(at ?t Warehouse1)
			(at ?w ?l)
		)
		:effect (and
			(warehouse_checked ?w)
			(increase (kilometers_travelled ?t) (distance_to_spandau ?l))
			(increase (trips ?t) 1)
			(increase (minutes_of_work ?s) (travel_duration))
			(increase (total_work) (travel_duration))
			(not (at ?s Warehouse1))
			(not (at ?t Warehouse1))
			(at ?s ?w)
			(at ?t ?w)
		)
	)

	(:action unload
		:parameters (?t - truck ?s - staff ?p - parcel ?w - warehouse)
		:precondition (and
			(not(= ?w Warehouse1))
			(at ?t ?w)
			(at ?s ?w)
			(parcel_in_truck ?p ?t)
		)
		:effect (and
			(increase (minutes_of_work ?s) 10)
			(increase (total_work) 10)
			(parcel_in_warehouse ?p ?w)
			(not(parcel_in_truck ?p ?t))
		)
	)

	(:action return_to_spandau
		:parameters (?t - truck ?s - driver ?w - warehouse ?l - location)
		:precondition (and
			(not(= ?w Warehouse1))
			(at ?s ?w)
			(at ?t ?w)
			(at ?w ?l)
			(forall(?p - parcel)(not(parcel_in_truck ?p ?t)))
		)
		:effect (and
			(increase (kilometers_travelled ?t) (distance_to_spandau ?l))
			(increase (minutes_of_work ?s) (travel_duration))
			(increase (total_work) (travel_duration))
			(not (at ?s ?w))
			(not (at ?t ?w))
			(at ?s Warehouse1)
			(at ?t Warehouse1)
		)
	)
)
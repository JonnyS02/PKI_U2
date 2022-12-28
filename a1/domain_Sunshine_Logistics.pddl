;Header and description

(define (domain domain_Sunshine_Logistics)

;remove requirements that are not needed
;(:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)
(:requirements :strips :fluents :typing )

(:types 
	staff
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
    (at ?o - object ?l - location)
    (parcelIn ?p - parcel ?t - truck)
    ;parcel p is located in the truck t
    (hasDrivingLicence ?s - staff)
    ;staff s has truck driving licence
    (hoursOfWork ?s - staff ?h - hours)
    ;Number of working hours of an employee
    (kilometerage ?t - truck  ?k - kilometers)
    ;kilometerage of a truck
    (truckOn ?t - truck ?r - road)
    ;the road the truck is driving on 
)

;(:functions ;todo: define numeric functions here
;    (distance ?r - road) 
;    ; Distance between two locations in km
;    (time ?r - road) 
;    ;travel time between two locations
;)

;define actions here
(:action load ; 
		:parameters (?t - truck ?p - parcel ?l - location)
		:precondition (and
		 (at ?t ?l) (at ?p ?l)
		)
		:effect (and
		 (not(at ?p ?l)) (parcelIn ?p ?t)
		)
	)

(:action transport 
		:parameters (?d - driver ?t - truck ?p - parcel ?from - location ?to - location
		)
		:precondition (and
		    (at ?d ?from) (at ?p ?from) (at ?t ?from) (hasDrivingLicence ?d)
		)
		:effect (and
		    (at ?d ?to) (at ?p ?to) (at ?t ?to) (not (at ?d ?from))(not (at ?p ?from))(not (at ?t ?from))
		    
		)
	)
(:action unload ; 
		:parameters (?t - truck ?p - parcel ?l - location)
		:precondition (and
		 (at ?t ?l) (at ?p ?l)
		)
		:effect (and
		 (at ?p ?l) (not(parcelIn ?p ?t))
		)
	)

(:action return ; 
		:parameters (?d - driver ?t - truck ?p - parcel ?from - location ?to - location)
		:precondition (and
		    (at ?d ?to) (at ?t ?to)
		)
		:effect (and
		     (at ?d ?from) (at ?t ?from)
		    (at ?d ?to) (at ?p ?to) (at ?t ?to) (not (at ?d ?from))(not (at ?p ?from))(not (at ?t ?from))
		    
			
		)
	)



)


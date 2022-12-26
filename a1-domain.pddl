;press Shift + Alt + F to format
(define (domain transport)
    (:requirements :typing :fluents)
    (:types
        mitarbeiter - object
        lastwagen - object
        warenhaus - object
        ort - object
        ware - object
    )
    (:predicates
        (at ?x - object ?y - warenhaus)
    )

    (:action transportieren
        :parameters (?m - mitarbeiter ?w - ware ?l - lastwagen ?von - warenhaus ?nach - warenhaus)
        :precondition (and (at ?m ?von) (at ?w ?von) (at ?l ?von))
        :effect (and (at ?m ?nach) (at ?w ?nach) (at ?l ?nach) (not (at ?m ?von))
            (not(at ?w ?von))
            (not (at ?l ?von)))
    )

    (:action rueckfahrt
        :parameters (?m - mitarbeiter ?l - lastwagen ?von - warenhaus ?nach - warenhaus)
        :precondition (and (at ?m ?von) (at ?l ?von))
        :effect (and (at ?m ?nach) (at ?l ?nach) (not(at ?m ?von)) (not (at ?l ?von)))
    )
)
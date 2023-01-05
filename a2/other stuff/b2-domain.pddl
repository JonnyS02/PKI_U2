(define (domain volkshochschule-planung-b)
    (:requirements :typing :fluents :conditional-effects :negative-preconditions)
    (:types
        zeitslot kurs raum lehrer
    )
    (:predicates
        (lehrer-kann-unterrichten ?l - lehrer ?k - kurs)
        (lehrer-verplant ?l - lehrer ?z - zeitslot)
        (raum-ist-belegt ?r - raum ?z - zeitslot)
    )
    (:functions
        (gewinn)
        (kurse)
        (gebuehr ?k - kurs)
        (kapazitaet ?r - raum)
        (teilnehmerzahl ?k - kurs)
        (anzahl-termine-lehrer ?l - lehrer)
    )

    (:action belegen
        :parameters (?r - raum ?z - zeitslot ?l - lehrer ?k - kurs)
        :precondition (and
            (>=(teilnehmerzahl ?k)(kapazitaet ?r))
            (not(lehrer-verplant ?l ?z))
            (lehrer-kann-unterrichten ?l ?k)
            (not(raum-ist-belegt ?r ?z))
        )
        :effect (and
            (increase (anzahl-termine-lehrer ?l) 1)
            (increase (kurse) 1)
            (increase (gewinn) (*(kapazitaet ?r)(gebuehr ?k)))
            (decrease (teilnehmerzahl ?k) (kapazitaet ?r))
            (lehrer-verplant ?l ?z)
            (raum-ist-belegt ?r ?z)
        )
    )
)
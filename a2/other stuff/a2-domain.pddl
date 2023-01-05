(define (domain volkshochschule-planung-a)
    (:requirements :typing :fluents :conditional-effects :negative-preconditions)
    (:types
        zeitslot kurs raum lehrer
    )
    (:predicates
        (lehrer-kann-unterrichten ?l - lehrer ?k - kurs)
        (lehrer-verplant ?l - lehrer ?z - zeitslot)
        (raum-ist-belegt ?r - raum ?z - zeitslot)
        (anzahl-termine-lehrer ?l - lehrer)
    )
    (:functions
        (plaetze)
        (kurs-Anzahl)
        (gewinn)
        (kapazitaet-raum ?r - raum)
        (teilnehmerzahl ?k - kurs)
        (gebuehren-kurs ?k - kurs)
    )

    (:action belegen
        :parameters (?r - raum ?z - zeitslot ?l - lehrer ?k - kurs)
        :precondition (and
            (>=(teilnehmerzahl ?k)(kapazitaet-raum ?r))
            (not(lehrer-verplant ?l ?z))
            (lehrer-kann-unterrichten ?l ?k)
            (not(raum-ist-belegt ?r ?z))
        )
        :effect (and
            (increase (plaetze) (kapazitaet-raum ?r))
            (increase (kurs-Anzahl) 1)
            (increase(gewinn)(*(gebuehren-kurs ?k) (kapazitaet-raum ?r)))
            (decrease(teilnehmerzahl ?k)(kapazitaet-raum ?r))
            (lehrer-verplant ?l ?z)
            (raum-ist-belegt ?r ?z)
        )
    )
)
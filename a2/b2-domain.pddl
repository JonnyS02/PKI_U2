(define (domain volkshochschule-planung-b)
    (:requirements :typing :fluents :conditional-effects :negative-preconditions)
    (:types
        zeitslot kurs raum lehrer
    )
    (:predicates
        (lehrer-kann-unterrichten ?l - lehrer ?k - kurs)
        (lehrer-unterrichtet ?l - lehrer ?z - zeitslot)
        (raum-ist-belegt ?r - raum ?z - zeitslot)
        (ist-nachmittag ?z - zeitslot)
    )
    (:functions
        (plaetze)
        (gewinn)
        (gebuehr ?k - kurs)
        (kapazitaet ?r - raum)
        (teilnehmerzahl ?k - kurs)
    )

    (:action belegen
        :parameters (?r - raum ?z - zeitslot ?l - lehrer ?k - kurs)
        :precondition (and
            (>=(teilnehmerzahl ?k)(kapazitaet ?r))
            (not(lehrer-unterrichtet ?l ?z))
            (lehrer-kann-unterrichten ?l ?k)
            (not(raum-ist-belegt ?r ?z))
        )
        :effect (and
            (increase (plaetze) (kapazitaet ?r))
            (increase (gewinn) (*(kapazitaet ?r)(gebuehr ?k)))
            (decrease (teilnehmerzahl ?k) (kapazitaet ?r))
            (lehrer-unterrichtet ?l ?z)
            (raum-ist-belegt ?r ?z)
            (decrease (teilnehmerzahl ?k) (kapazitaet ?r))
        )
    )
)
(define (domain volkshochschule-planung)
    (:requirements :typing :fluents :conditional-effects)
    (:types
        zeitslot kurs raum - objekt
        lehrer - agent
    )
    (:predicates
        (kurs-abhaltbar-in-raum ?k - kurs ?r - raum)
        (lehrer-kann-unterrichten ?l - lehrer ?k - kurs)
        (lehrer-unterrichtet ?l - lehrer ?z - zeitslot)
        (raum-ist-belegt ?r - raum ?z - zeitslot)
        (belegt ?k - kurs ?z - zeitslot)
    )
    (:functions
        (kursanzahl)
        (kapazitaet ?r - raum)
        (teilnehmerzahl ?k - kurs)
    )
    
    (:action belegen
        :parameters (?r - raum ?z - zeitslot ?l - lehrer ?k - kurs)
        :precondition (and
            (kurs-abhaltbar-in-raum ?k ?r)
            (lehrer-kann-unterrichten ?l ?k)
            (not(lehrer-unterrichtet ?l ?z))
            (not(raum-ist-belegt ?r ?z))
            (not(belegt ?k ?z))
        )
        :effect (and
            (lehrer-unterrichtet ?l ?z)
            (raum-ist-belegt ?r ?z)
            (increase (kursanzahl) 1)
            (decrease (teilnehmerzahl ?k) (kapazitaet ?r))
            (belegt ?k ?z)
        )
    )
)
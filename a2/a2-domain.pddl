(define (domain volkshochschule-planung)
    (:requirements :typing :fluents :conditional-effects)
    (:types
        zeitslot kurs raum - objekt
        lehrer - agent
    )
    (:predicates
        (lehrer-kann-unterrichten ?l - lehrer ?k - kurs)
        (lehrer-unterrichtet ?l - lehrer ?z - zeitslot)
        (raum-ist-belegt ?r - raum ?z - zeitslot)
    )
    (:functions
        (plaetze)
        (kursanzahl)
        (kapazitaet ?r - raum)
        (teilnehmerzahl ?k - kurs)
    )

    (:action belegen
        :parameters (?r - raum ?z - zeitslot ?l - lehrer ?k - kurs)
        :precondition (and
            (>(teilnehmerzahl ?k)0)
            (lehrer-kann-unterrichten ?l ?k)
            (not(lehrer-unterrichtet ?l ?z))
            (not(raum-ist-belegt ?r ?z))
        )
        :effect (and
            (lehrer-unterrichtet ?l ?z)
            (raum-ist-belegt ?r ?z)
            (increase (kursanzahl) 1)
            (decrease (teilnehmerzahl ?k) (kapazitaet ?r))
            (increase (plaetze) (kapazitaet ?r))
        )
    )
)
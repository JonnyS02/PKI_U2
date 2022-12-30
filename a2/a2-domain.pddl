(define (domain volkshochschule-planung)
    (:requirements :typing :fluents :conditional-effects)
    (:types
        zeitslot kurs raum lehrer
    )
    (:predicates
        (lehrer-kann-unterrichten ?l - lehrer ?k - kurs)
        (lehrer-unterrichtet ?l - lehrer ?z - zeitslot)
        (raum-ist-belegt ?r - raum ?z - zeitslot)
    )
    (:functions
        (plaetze)
        (kapazitaet ?r - raum)
        (teilnehmerzahl ?k - kurs)
    )

    (:action belegen
        :parameters (?r - raum ?z - zeitslot ?l - lehrer ?k - kurs)
        :precondition (and
            ;(>(teilnehmerzahl ?k)0)   ; Idee: Ein Kurs soll nicht mehr vergeben werden, wenn die Summer der Raumkapazitäten größer ist, als die Teilnehmerzahl.
            (not(lehrer-unterrichtet ?l ?z))
            (lehrer-kann-unterrichten ?l ?k)
            (not(raum-ist-belegt ?r ?z))
        )
        :effect (and
            (lehrer-unterrichtet ?l ?z)
            (raum-ist-belegt ?r ?z)
            (increase (plaetze) (kapazitaet ?r))
            (decrease (teilnehmerzahl ?k) (kapazitaet ?r)) ; Die Raumkapazität wird von der Teilnehmeranzahl abgezogen, da die Anzahl der Teilnehmer jetzt einen Platz haben.
        )
    )
)
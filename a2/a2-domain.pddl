;press Shift + Alt + F to format
(define (domain volkshochschule-planung)
    (:requirements :typing :conditional-effects)
    (:types
        zahl kurs raum - objekt
        lehrer - agent
        zeitslot - zeit
    )
    (:predicates
        (kurs-angeboten ?k - kurs)
        (lehrer-unterrichtet ?l - lehrer ?k - kurs)
        (im-raum ?k - kurs ?r - raum)
        (raum-kapazitaet ?r - raum ?n - zahl)
        (teilnehmerzahl ?k - kurs ?n - zahl)
        (geplant ?k - kurs ?t - zeitslot)
        (unterrichtet ?l - lehrer ?k - kurs ?t - zeitslot)
    )

    (:action unterrichten
        :parameters (?l - lehrer ?k - kurs ?t - zeitslot)
        :precondition (and (lehrer-unterrichtet ?l ?k)
            (not (unterrichtet ?l ?k ?t))
            (geplant ?k ?t))
        :effect (and (unterrichtet ?l ?k ?t)
            (decrease (raum-kapazitaet ?r) 1))
    )
    (:action planen
        :parameters (?k - kurs ?t - zeitslot)
        :precondition (not (geplant ?k ?t))
        :effect (geplant ?k ?t)
    )
    (:action belegen
        :parameters (?k - kurs ?r - raum ?t1 - zeit ?t2 - zeit)
    )
)
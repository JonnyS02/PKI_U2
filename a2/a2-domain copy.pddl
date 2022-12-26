(define (domain volkshochschule-planung)
    (:requirements :typing :fluents :conditional-effects)
    (:types
        kurs raum - objekt
        lehrer - agent
        zeitslot - zeit
    )
    (:predicates
        (kurs-angeboten ?k - kurs)
        (lehrer-unterrichtet ?l - lehrer ?k - kurs)
        (im-raum ?k - kurs ?r - raum)
        (raum-kapazität ?r - raum ?n - zahl)
        (teilnehmerzahl ?k - kurs ?n - zahl)
        (geplant ?k - kurs ?t - zeitslot)
        (unterrichtet ?l - lehrer ?k - kurs ?t - zeitslot)
    )
    (:fluents
        (kapazität ?r - raum ?n - zahl)
    )
    (:action unterrichten
        :parameters (?l - lehrer ?k - kurs ?t - zeitslot)
        :precondition (and (lehrer-unterrichtet ?l ?k)
            (not (unterrichtet ?l ?k ?t))
            (geplant ?k ?t))
        :effect (and (unterrichtet ?l ?k ?t)
            (decrease (kapazität ?r) (- ?n 1)))
    )
    (:action planen
        :parameters (?k - kurs ?t - zeitslot)
        :precondition (not (geplant ?k ?t))
        :effect (geplant ?k ?t)
    )
    (:durative-action belegen
        :parameters (?k - kurs ?r - raum ?t1 ?t2 - zeit)
        :duration (= ?t2 (+ ?t1 1))
        :precondition (and (im-raum ?k ?r)
            (geplant ?k ?t1)
            (kapazität ?r ?n)
            (>= ?n (teilnehmerzahl ?k)))
        :effect (and (decrease
                (kapazität ?r)
                (- ?n (teilnehmerzahl ?k)))
            (not (geplant ?k ?t2)))
    )
)

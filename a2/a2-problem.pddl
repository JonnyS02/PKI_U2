(define (problem volkshochschule-planung-woche1)
    (:domain volkshochschule-planung)
    (:objects
        EDV_01 EDV_02 Webdesign Malerei Tonformen - kurs
        Ahorn Eiche Birke Kiefer - lehrer
        Raum01 Raum02 Raum03 Raum04 - raum
        t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 - zeitslot
    )
    (:init
        (kurs-angeboten EDV_01)
        (kurs-angeboten EDV_02)
        (kurs-angeboten Webdesign)
        (kurs-angeboten Malerei)
        (kurs-angeboten Tonformen)

        (lehrer-unterrichtet Ahorn EDV_01)
        (lehrer-unterrichtet Ahorn EDV_02)
        (lehrer-unterrichtet Eiche EDV_02)
        (lehrer-unterrichtet Eiche Webdesign)
        (lehrer-unterrichtet Birke Webdesign)
        (lehrer-unterrichtet Birke Malerei)
        (lehrer-unterrichtet Kiefer Malerei)
        (lehrer-unterrichtet Kiefer Tonformen)
        
        (teilnehmerzahl EDV_01 123)
        (teilnehmerzahl EDV_02 50)
        (teilnehmerzahl Webdesign 84)
        (teilnehmerzahl Malerei 105)
        (teilnehmerzahl Tonformen 39)

        (raum-kapazität Raum01 10)
        (raum-kapazität Raum02 12)
        (raum-kapazität Raum03 8)
        (raum-kapazität Raum04 5)

        (im-raum EDV_01 Raum01)
        (im-raum EDV_02 Raum02)
        (im-raum Webdesign Raum03)
        (im-raum Malerei Raum04)
        (im-raum Tonformen Raum04)
    )
    (:goal
        (and
            (geplant EDV_01 t1)
            (geplant EDV_01 t2)
            (geplant EDV_02 t3)
            (geplant EDV_02 t4)
            (geplant Webdesign t5)
            (geplant Webdesign t6)
            (geplant Malerei t7)
            (geplant Malerei t8)
            (geplant Tonformen t9)
            (geplant Tonformen t10)
        )
    )
)
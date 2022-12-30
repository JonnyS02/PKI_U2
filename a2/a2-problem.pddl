(define (problem volkshochschule-planung-woche1)
    (:domain volkshochschule-planung)
    (:objects
        EDV_01 EDV_02 Webdesign Malerei Tonformen - kurs
        Ahorn Eiche Birke Kiefer - lehrer
        Raum01 Raum02 Raum03 Raum04 - raum
        t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 - zeitslot
    )
    (:init
        (= (kursanzahl) 0)
        (= (plaetze) 0)

        (lehrer-kann-unterrichten Ahorn EDV_01)
        (lehrer-kann-unterrichten Ahorn EDV_02)
        (lehrer-kann-unterrichten Eiche EDV_02)
        (lehrer-kann-unterrichten Eiche Webdesign)
        (lehrer-kann-unterrichten Birke Webdesign)
        (lehrer-kann-unterrichten Birke Malerei)
        (lehrer-kann-unterrichten Kiefer Malerei)
        (lehrer-kann-unterrichten Kiefer Tonformen)

        (=(teilnehmerzahl EDV_01) 123)
        (=(teilnehmerzahl EDV_02) 50)
        (=(teilnehmerzahl Webdesign) 84)
        (=(teilnehmerzahl Malerei) 105)
        (=(teilnehmerzahl Tonformen) 39)

        (=(kapazitaet Raum01) 10)
        (=(kapazitaet Raum02) 12)
        (=(kapazitaet Raum03) 8)
        (=(kapazitaet Raum04) 5)
    )
    (:goal
        (and
            (=(kursanzahl)30)
        )
    )
    (:metric maximize
        (plaetze)
    )
)
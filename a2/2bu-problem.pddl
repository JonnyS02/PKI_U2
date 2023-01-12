(define (problem volkshochschule-planung-woche1-bu)
    (:domain volkshochschule-planung-bu)
    (:objects
        EDV_01 EDV_02 Webdesign Malerei Tonformen - kurs
        Ahorn Eiche Birke Kiefer - lehrer
        Raum01 Raum02 Raum03 Raum04 - raum
        Tag1Vormittag Tag2Vormittag Tag3Vormittag Tag4Vormittag Tag5Vormittag - zeitslot
        Tag1Nachmittag Tag2Nachmittag Tag3Nachmittag Tag4Nachmittag Tag5Nachmittag - zeitslot

    )
    (:init
        (=(gewinn)0)
        (=(kurse)0)

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

        (=(gebuehr EDV_01)20)
        (=(gebuehr EDV_02)30)
        (=(gebuehr Webdesign)25)
        (=(gebuehr Malerei)30)
        (=(gebuehr Tonformen)50)

        (=(anzahl-termine-lehrer Ahorn)0)
        (=(anzahl-termine-lehrer Eiche)0)
        (=(anzahl-termine-lehrer Birke)0)
        (=(anzahl-termine-lehrer Kiefer)0)

        ;2d
        ;(lehrer-verplant Birke Tag1Nachmittag)
        ;(lehrer-verplant Birke Tag2Nachmittag)
        ;(lehrer-verplant Birke Tag3Nachmittag)
        ;(lehrer-verplant Birke Tag4Nachmittag)
        ;(lehrer-verplant Birke Tag5Nachmittag)
        ;(lehrer-verplant Kiefer Tag1Vormittag)
        ;(lehrer-verplant Kiefer Tag2Vormittag)
        ;(lehrer-verplant Kiefer Tag3Vormittag)
        ;(lehrer-verplant Kiefer Tag4Vormittag)
        ;(lehrer-verplant Kiefer Tag5Vormittag)

    )
    (:goal
        (and ;2a
            (=(kurse)40)

            ;2c
            ;(=(anzahl-termine-lehrer Ahorn)7)
            ;(=(anzahl-termine-lehrer Eiche)5)
            ;(=(anzahl-termine-lehrer Birke)4)
            ;(=(anzahl-termine-lehrer Kiefer)5)
        )
    ) ;2b
    ;(:metric maximize
    ; (gewinn)      
    ;)
)

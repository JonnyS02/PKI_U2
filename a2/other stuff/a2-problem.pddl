(define (problem volkshochschule-planung-woche1-a)
    (:domain volkshochschule-planung-a)
    (:objects
        EDV_01 EDV_02 Webdesign Malerei Tonformen - kurs
        Ahorn Eiche Birke Kiefer - lehrer
        Raum01 Raum02 Raum03 Raum04 - raum
        Tag1Vormittag Tag2Vormittag Tag3Vormittag Tag4Vormittag Tag5Vormittag - zeitslot
        Tag1Nachmittag Tag2Nachmittag Tag3Nachmittag Tag4Nachmittag Tag5Nachmittag - zeitslot

    )
    (:init
        (=(kurs-Anzahl)0)
        (=(gewinn)0)
        (=(plaetze)0)
        
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

        (=(kapazitaet-raum Raum01) 10)
        (=(kapazitaet-raum Raum02) 12)
        (=(kapazitaet-raum Raum03) 8)
        (=(kapazitaet-raum Raum04) 5)

        (=(gebuehren-kurs EDV_01)20)
        (=(gebuehren-kurs EDV_02)30)
        (=(gebuehren-kurs Webdesign)25)
        (=(gebuehren-kurs Malerei)30)
        (=(gebuehren-kurs Tonformen)50)

    )
    (:goal
        (and
            (=(kurs-Anzahl)40)
        )
    )
    (:metric maximize
       ; (gewinn)
    )
)
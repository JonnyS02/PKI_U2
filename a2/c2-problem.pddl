(define (problem volkshochschule-planung-woche1-c)
    (:domain volkshochschule-planung-c)
    (:objects
        EDV_01 EDV_02 Webdesign Malerei Tonformen - kurs
        Ahorn Eiche Birke Kiefer - lehrer
        Raum01 Raum02 Raum03 Raum04 - raum
        Tag1Vormittag Tag2Vormittag Tag3Vormittag Tag4Vormittag Tag5Vormittag - zeitslot
        Tag1Nachmittag Tag2Nachmittag Tag3Nachmittag Tag4Nachmittag Tag5Nachmittag - zeitslot

    )
    (:init
        (=(gewinn)0)
        (=(plaetze)0)

        (=(lehrer-termine Ahorn)0)
        (=(lehrer-termine Eiche)0)
        (=(lehrer-termine Birke)0)
        (=(lehrer-termine Kiefer)0)

        (ist-nachmittag Tag1Nachmittag)
        (ist-nachmittag Tag2Nachmittag)
        (ist-nachmittag Tag3Nachmittag)
        (ist-nachmittag Tag4Nachmittag)
        (ist-nachmittag Tag5Nachmittag)

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

        ;b
        (=(gebuehr EDV_01)0)
        (=(gebuehr EDV_02)30)
        (=(gebuehr Webdesign)0)
        (=(gebuehr Malerei)0)
        (=(gebuehr Tonformen)0)

        (lehrer-unterrichtet Birke Tag1Nachmittag)
        (lehrer-unterrichtet Birke Tag2Nachmittag)
        (lehrer-unterrichtet Birke Tag3Nachmittag)
        (lehrer-unterrichtet Birke Tag4Nachmittag)
        (lehrer-unterrichtet Birke Tag5Nachmittag)

        (lehrer-unterrichtet Kiefer Tag1Vormittag)
        (lehrer-unterrichtet Kiefer Tag2Vormittag)
        (lehrer-unterrichtet Kiefer Tag3Vormittag)
        (lehrer-unterrichtet Kiefer Tag4Vormittag)
        (lehrer-unterrichtet Kiefer Tag5Vormittag)


    )
    (:goal
        (and
            (=(lehrer-termine Ahorn)7)
            (=(lehrer-termine Eiche)5)
            (=(lehrer-termine Birke)4)
            (=(lehrer-termine Kiefer)5)
        )
    )
    (:metric maximize
        (plaetze)
    )
)
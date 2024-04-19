//
//  Flight.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 17/04/2024.
//

import Foundation

struct Site {
    let name: String
    let price: Double
    
    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
}

class Flight {
    
    enum SeatType {
        case economy, business, firstclass
    }
    
    let id: Int
    let flightNo: Int
    let departShortName: String
    let departLongName: String
    let departDateTime: Date?
    let arrivalShortName: String
    let arrivalLongName: String
    let arrivalDateTime: Date?
    let airlineName: String
    let airlineImgUrl: String
    let isNonStop: Bool
    let numOfTraveler: Int
    var seatType: SeatType
    let sites: [Site]
    var isSaved: Bool
    let price: Double
    
    init(id: Int, flightNo: Int, departShortName: String, departLongName: String, departDateTime: Date?, arrivalShortName: String, arrivalLongName: String, arrivalDateTime: Date?, airlineName: String, airlineImgUrl: String, isNonStop: Bool, numOfTraveler: Int, seatType: SeatType, sites: [Site], isSaved: Bool, price: Double) {
        self.id = id
        self.flightNo = flightNo
        self.departShortName = departShortName
        self.departLongName = departLongName
        self.departDateTime = departDateTime
        self.arrivalShortName = arrivalShortName
        self.arrivalLongName = arrivalLongName
        self.arrivalDateTime = arrivalDateTime
        self.airlineName = airlineName
        self.airlineImgUrl = airlineImgUrl
        self.isNonStop = isNonStop
        self.numOfTraveler = numOfTraveler
        self.seatType = seatType
        self.sites = sites
        self.isSaved = isSaved
        self.price = price
    }
    
    static func getDummyData() -> [Flight] {
        return [
            .init(id: 1, flightNo: 1601, departShortName: "LTN", departLongName: "London", departDateTime: "2024-03-03 12:34".toDate(), arrivalShortName: "GDN", arrivalLongName: "Gdansk", arrivalDateTime: "2024-03-03 13:34".toDate(), airlineName: "Wizz Air", airlineImgUrl: "al_wizz_logo", isNonStop: true, numOfTraveler: 1, seatType: .economy, sites: [
                .init(name: "Kiwi.com", price: 18),
                .init(name: "eDreams", price: 19),
                .init(name: "Booking.com", price: 24),
                .init(name: "OneTravel", price: 28)
            ], isSaved: true, price: 19),
            .init(id: 2, flightNo: 1602, departShortName: "LTN", departLongName: "London", departDateTime: "2024-03-03 13:34".toDate(), arrivalShortName: "GDN", arrivalLongName: "Gdansk", arrivalDateTime: "2024-03-03 14:34".toDate(), airlineName: "LOT", airlineImgUrl: "al_lot_logo", isNonStop: true, numOfTraveler: 1, seatType: .economy, sites: [
                .init(name: "Kiwi.com", price: 18),
                .init(name: "eDreams", price: 19),
                .init(name: "Booking.com", price: 24),
                .init(name: "OneTravel", price: 28)
            ], isSaved: false, price: 19)
        ]
    }
}

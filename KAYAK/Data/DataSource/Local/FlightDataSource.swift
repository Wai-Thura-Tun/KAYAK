//
//  FlightDataSourxce.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 17/04/2024.
//

import Foundation

class FlightDataSource {
    private var flights = Flight.getDummyData()
    
    static let shared = FlightDataSource.init()
    
    private init() { }
    
    func getFlightList() -> [Flight] {
        return flights
    }
    
    func getFlightById(flightId id: Int) -> Flight? {
        return flights.first { $0.id == id }
    }
    
    func toggleSaveStatus(flightId id: Int) {
        flights.first { $0.id == id }?.isSaved.toggle()
    }
}

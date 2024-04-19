//
//  FlightRepository.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 17/04/2024.
//

import Foundation

class FlightRepository {
    private let dataSource = FlightDataSource.shared
    
    func getFlightList() -> [Flight] {
        return dataSource.getFlightList()
    }
    
    func getFlightById(flightId id: Int) -> Flight? {
        return dataSource.getFlightById(flightId: id)
    }
    
    func toggleSaveStatus(flightId id: Int) {
        dataSource.toggleSaveStatus(flightId: id)
    }
}

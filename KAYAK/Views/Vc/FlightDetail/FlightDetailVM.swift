//
//  FlightDetailVM.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 16/04/2024.
//

import Foundation

protocol FlightDetailViewDelegate {
    func onGetFlightDetail()
}

class FlightDetailVM {
    private let repository: FlightRepository = FlightRepository.init()
    
    private let delegate: FlightDetailViewDelegate?
    
    private (set) var flight: Flight? = nil {
        didSet {
            if let _ = flight {
                delegate?.onGetFlightDetail()
            }
        }
    }
    
    init(delegate: FlightDetailViewDelegate) {
        self.delegate = delegate
    }
    
    func getFlightById(flightId id: Int) {
        flight = repository.getFlightById(flightId: id)
    }
    
    func toggleSaveStatus() {
        guard let flight = flight else { return }
        repository.toggleSaveStatus(flightId: flight.id)
        getFlightById(flightId: flight.id)
    }
}


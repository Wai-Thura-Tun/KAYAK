//
//  FlightListVM.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 16/04/2024.
//

import Foundation

protocol FlightListViewDelegate {
    func onGetFlightLists()
}

class FlightListVM {
    private let repository: FlightRepository = .init()
    
    private (set) var flights: [Flight] = [] {
        didSet {
            delegate.onGetFlightLists()
        }
    }
    
    private let delegate: FlightListViewDelegate
    
    init(delegate: FlightListViewDelegate) {
        self.delegate = delegate
    }
    
    func getFlightLists() {
        flights = repository.getFlightList().sorted(by: { $0.price < $1.price })
    }
    
    func getFlightById(flightId id: Int) -> Flight? {
        return repository.getFlightById(flightId: id)
    }
    
    func toggleSaveStatus(flightId id: Int) {
        repository.toggleSaveStatus(flightId: id)
        getFlightLists()
    }
}

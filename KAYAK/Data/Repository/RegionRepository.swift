//
//  RegionRepository.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 10/04/2024.
//

import Foundation

class RegionRepository {
    private let dataSource: RegionDataSource = RegionDataSource.shared
    
    func getAll() -> [Region] {
        return dataSource.getAll()
    }
    
    func toggleSelectStatus(regionId id: Int) {
        dataSource.toggleSelectStatus(regionId: id)
    }
}

//
//  RegionDataSource.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 10/04/2024.
//

import Foundation

class RegionDataSource {
    private var regionLists: [Region] = Region.getDummyData()
    
    static let shared = RegionDataSource.init()
    
    private init() {}
    
    func getAll() -> [Region] {
        return regionLists
    }
    
    func toggleSelectStatus(regionId id: Int) {
        regionLists.first { $0.id == id }?.isSelected.toggle()
    }
    
}

//
//  WelcomeVM .swift
//  KAYAK
//
//  Created by Wai Thura Tun on 10/04/2024.
//

import Foundation

protocol WelcomeViewDelegate {
    func onGetRegions()
}

class WelcomeVM {
    private let repository: RegionRepository = RegionRepository.init()
    
    private (set) var regions: [Region] = [] {
        didSet {
            self.delegate.onGetRegions()
        }
    }
    
    private let delegate: WelcomeViewDelegate
    
    init(delegate: WelcomeViewDelegate) {
        self.delegate = delegate
    }
    
    func getAll() {
        regions = repository.getAll()
    }
    
    func toggleSelectStatus(regionId id: Int) {
        repository.toggleSelectStatus(regionId: id)
        getAll()
    }
    
    func toggleSelectStatusMulti(regionIds ids: [Int]) {
        ids.forEach { id in
            repository.toggleSelectStatus(regionId: id)
        }
        getAll()
    }
}

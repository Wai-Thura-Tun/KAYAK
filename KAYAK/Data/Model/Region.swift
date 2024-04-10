//
//  Region.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 30/03/2024.
//

import Foundation

class Region {
    let id: Int
    let name: String
    let flagUrl: String
    let website: String
    let currency: String
    var isSelected: Bool
    
    init(id: Int, name: String, flagUrl: String, website: String, currency: String, isSelected: Bool = false) {
        self.id = id
        self.name = name
        self.flagUrl = flagUrl
        self.website = website
        self.currency = currency
        self.isSelected = isSelected
    }
    
    static func getDummyData() -> [Region] {
        return [
            .init(id: 1, name: "United States", flagUrl: "usa.flg", website: "kayak.com", currency: "$ (USD)"),
            .init(id: 2, name: "Singapore", flagUrl: "singapore.flg", website: "kayak.sg", currency: "S$ (SGD)")
        ]
    }
}

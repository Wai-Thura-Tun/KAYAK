//
//  Date.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 16/04/2024.
//

import Foundation

extension Date {
    func toString(with format: String = "E, MMM d") -> String? {
        let formatter = DateFormatter.init()
        formatter.dateFormat = format
        formatter.timeZone = .current
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.string(from: self)
    }
}

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

extension Optional where Wrapped == Date {
    func convertDateFormat() -> String {
        var dateString = self?.toString(with: "h:mma")
        let amPm = dateString?.suffix(2)
        dateString = dateString?.replacingOccurrences(of: amPm ?? "", with: "")
        return "\(dateString ?? "")\(amPm?.prefix(1).lowercased() ?? "")"
    }
    
    func calculateDuration(to endDate: Date?) -> String? {
        guard let startDate = self, let endDate = endDate else { return nil }
        let calendar = Calendar.current
        let dateComponet = calendar.dateComponents([.hour, .minute], from: startDate, to: endDate)
        let hour = dateComponet.hour ?? 0
        let minute = dateComponet.minute ?? 0
        return "\(hour)h\(minute > 0 ? " \(minute)m" : "")"
    }
}



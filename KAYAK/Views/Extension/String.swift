//
//  String.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 10/04/2024.
//

import Foundation

extension Optional where Wrapped == String {
    var isValidEmail: Bool {
        guard let email = self, !email.isEmpty, email.wholeMatch(of: emailRegex) != nil else { return false }
        return true
    }
}

extension String {
    func toDate(with format: String = "yyyy-MM-dd HH:mm") -> Date? {
        let formatter = DateFormatter.init()
        formatter.dateFormat = format
        formatter.timeZone = .current
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.date(from: self)
    }
}

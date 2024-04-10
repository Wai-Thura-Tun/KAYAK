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

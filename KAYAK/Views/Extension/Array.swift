//
//  Array.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 11/04/2024.
//

import Foundation
import UIKit

extension Array where Element == UIButton? {
    func addTarget(action selector: Selector) {
        self.compactMap { $0 }.forEach { item in
            item.addTarget(self, action: selector, for: .touchUpInside)
        }
    }
}

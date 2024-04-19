//
//  UIView.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 17/04/2024.
//

import Foundation
import UIKit

extension UIView {
    func addBorderBottom(color: CGColor, width: CGFloat) {
        let borderLayer = CALayer.init()
        borderLayer.backgroundColor = color
        borderLayer.frame = CGRect(x: 0, y: self.frame.height - width, width: self.frame.width, height: width)
        layer.addSublayer(borderLayer)
    }
}

//
//  UITextField.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 10/04/2024.
//

import Foundation
import UIKit

extension UITextField {
    
    func addCancelButtonToKeyboard(action selector: Selector, target: Any) {
        let toolBar = UIToolbar.init()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        
        let cancelBarBtn: UIBarButtonItem = UIBarButtonItem.init(
            title: "Cancel",
            style: .plain,
            target: target,
            action: selector)
        
        toolBar.setItems([cancelBarBtn], animated: true)
        self.inputAccessoryView = toolBar
    }
    
}

//
//  RootNC.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 26/03/2024.
//

import UIKit

class RootNC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.navigateToLogin()
        }
    }

    func navigateToLogin() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
        guard let vc = vc else { return }
        pushViewController(vc, animated: true)
    }
    
    func navigateToHome() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "")
        pushViewController(vc, animated: true)
    }
}

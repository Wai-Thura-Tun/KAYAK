//
//  LoginVC.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 27/03/2024.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var btnSigninEmail: UIButton!
    @IBOutlet weak var btnTermsOfUse: UIButton!
    @IBOutlet weak var btnPrivacyPolicy: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        setUpBinding()
    }
    
    func setUpView() {
        btnSigninEmail.layer.borderWidth = 1
        btnSigninEmail.layer.borderColor = UIColor.black.cgColor
        btnSigninEmail.layer.cornerRadius = 5
    }
    
    func setUpBinding() {
        btnSigninEmail.addTarget(self, action: #selector(onTapContinueWithEmail), for: .touchUpInside)
        btnTermsOfUse.addTarget(self, action: #selector(onTapTermsOfUse), for: .touchUpInside)
        btnPrivacyPolicy.addTarget(self, action: #selector(onTapPrivacyPolicy), for: .touchUpInside)
    }
    
    @objc func onTapContinueWithEmail() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "EmailVC") as? EmailVC
        guard let vc = vc else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func onTapTermsOfUse() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WebViewVC") as? WebViewVC
        guard let vc = vc else { return }
        let navController = UINavigationController(rootViewController: vc)
        present(navController, animated: true)
    }
    
    @objc func onTapPrivacyPolicy() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WebViewVC") as? WebViewVC
        guard let vc = vc else { return }
        let navController = UINavigationController(rootViewController: vc)
        present(navController, animated: true)
    }
}

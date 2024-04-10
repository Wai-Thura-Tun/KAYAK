//
//  LoginVC.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 10/04/2024.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var btnSignInEmail: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpBindings()
    }
    
    private func setUpViews() {
        addBorderToSignInEmail()
    }
    
    private func setUpBindings() {
        btnSignInEmail.addTarget(self, action: #selector(onTapSignInEmail), for: .touchUpInside)
    }
    
    @objc func onTapSignInEmail() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "EmailVC") as? EmailVC
        guard let vc = vc else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func addBorderToSignInEmail() {
        btnSignInEmail.layer.borderWidth = 1
        btnSignInEmail.layer.borderColor = UIColor.darkGray.cgColor
        btnSignInEmail.layer.cornerRadius = 5
    }
}

//
//  LoginVC.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 10/04/2024.
//

import UIKit
import SafariServices

class LoginVC: UIViewController {

    @IBOutlet weak var btnSignInEmail: UIButton!
    @IBOutlet weak var btnTerms: UIButton!
    @IBOutlet weak var btnPrivacy: UIButton!
    
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
        btnTerms.addTarget(self, action: #selector(onTapTerms), for: .touchUpInside)
        btnPrivacy.addTarget(self, action: #selector(onTapPrivacy), for: .touchUpInside)
    }
    
    @objc func onTapSignInEmail() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "EmailVC") as? EmailVC
        guard let vc = vc else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func onTapTerms() {
        guard let url = URL(string: "https://www.kayak.sg/terms-of-use") else { return }
        let safariVC = SFSafariViewController.init(url: url)
        present(safariVC, animated: true)
    }
    
    @objc func onTapPrivacy() {
        guard let url = URL(string: "https://www.kayak.sg/privacy") else { return }
        let safariVC = SFSafariViewController.init(url: url)
        present(safariVC, animated: true)
    }
    
    private func addBorderToSignInEmail() {
        btnSignInEmail.layer.borderWidth = 1
        btnSignInEmail.layer.borderColor = UIColor.darkGray.cgColor
        btnSignInEmail.layer.cornerRadius = 5
    }
}

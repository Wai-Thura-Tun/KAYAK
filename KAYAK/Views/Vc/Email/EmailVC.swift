//
//  EmailVC.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 27/03/2024.
//

import UIKit

class EmailVC: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnContinue: UIButton!
    
    private var isContinueEnabled: Bool = false {
        didSet {
            btnContinue.isEnabled = isContinueEnabled
            btnContinue.backgroundColor = isContinueEnabled ? UIColor.systemIndigo : UIColor.systemGray
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        setUpBindings()
    }
    
    private func setUpViews() {
        btnContinue.layer.cornerRadius = 5
        tfEmail.addCancelButtonToKeyboard(action: #selector(onTapCancelBarButton), target: self)
        isContinueEnabled = false
    }
    
    private func setUpBindings() {
        btnBack.addTarget(self, action: #selector(onTapBackBtn), for: .touchUpInside)
        tfEmail.addTarget(self, action: #selector(onValidate), for: .editingChanged)
        btnContinue.addTarget(self, action: #selector(onTapContinueBtn), for: .touchUpInside)
    }

    @objc func onTapBackBtn() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func onTapContinueBtn() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CreateAccountVC") as? CreateAccountVC
        guard let vc = vc else { return }
        vc.email = tfEmail.text!
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func onValidate() {
        isContinueEnabled = tfEmail.text.isValidEmail
    }
    
    @objc func onTapCancelBarButton() {
        tfEmail.resignFirstResponder()
    }
}

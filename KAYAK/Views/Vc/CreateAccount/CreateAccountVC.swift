//
//  CreateAccountVC.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 30/03/2024.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var imgCheckBox: UIImageView!
    @IBOutlet weak var btnCheckBox: UIButton!
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblCreateAcc: UILabel!

    private var isDealsChecked: Bool = false {
        didSet {
            imgCheckBox.image = UIImage(named: isDealsChecked ? "checked.on" : "checked.off")
        }
    }
    
    var email: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        setUpBindings()
    }

    private func setUpViews() {
        lblCreateAcc.text! += " \(email)."
        isDealsChecked = false
    }
    
    private func setUpBindings() {
        btnBack.addTarget(self, action: #selector(onTapBackBtn), for: .touchUpInside)
        btnCheckBox.addTarget(self, action: #selector(onTapCheckBoxBtn), for: .touchUpInside)
        btnContinue.addTarget(self, action: #selector(onTapContinueBtn), for: .touchUpInside)
    }
    
    @objc func onTapBackBtn() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func onTapCheckBoxBtn() {
        isDealsChecked.toggle()
    }
    
    @objc func onTapContinueBtn() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NotiInfoVC") as? NotiInfoVC
        guard let vc = vc else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

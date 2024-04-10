//
//  NotificationVC.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 30/03/2024.
//

import UIKit

class NotiInfoVC: UIViewController {

    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var btnEnableNotification: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    private func setUpBindings() {
        btnSkip.addTarget(self, action: #selector(onTapEnableAndSkip), for: .touchUpInside)
        btnEnableNotification.addTarget(self, action: #selector(onTapEnableAndSkip), for: .touchUpInside)
    }
    
    @objc func onTapEnableAndSkip() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeVC
        guard let vc = vc else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

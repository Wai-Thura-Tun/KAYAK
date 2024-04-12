//
//  NotificationVC.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 30/03/2024.
//

import UIKit

class NotiInfoVC: UIViewController {

    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var btnEnableNoti: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpBindings()
    }

    private func setUpBindings() {
        [btnSkip, btnEnableNoti].addTarget(action: #selector(onTapEnableAndSkip))
    }
    
    @objc func onTapEnableAndSkip() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeVC
        guard let vc = vc else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

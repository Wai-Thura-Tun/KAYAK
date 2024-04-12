//
//  ProfileVC.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 12/04/2024.
//

import UIKit

class ProfileVC: UIViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        tabBarItem = UITabBarItem.init(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 4)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        setUpBindings()
    }
    
    private func setUpViews() {
        
    }
    
    private func setUpBindings() {
        
    }

}

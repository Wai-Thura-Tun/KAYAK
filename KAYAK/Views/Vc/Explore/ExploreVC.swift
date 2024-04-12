//
//  ExploreVC.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 12/04/2024.
//

import UIKit

class ExploreVC: UIViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        tabBarItem = UITabBarItem.init(title: "Explore", image: UIImage(systemName: "network"), tag: 2)
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

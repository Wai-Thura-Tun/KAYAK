//
//  TabbarVC.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 12/04/2024.
//

import UIKit

class TabbarVC: UITabBarController {

    class CustomHeightTabbar: UITabBar {
        
        override func sizeThatFits(_ size: CGSize) -> CGSize {
            var size = super.sizeThatFits(size)
            size.height = 90
            return size
        }
        
    }
    
    private var homeVC: HomeVC {
        let storyboard = UIStoryboard.init(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        return vc
    }
    
    private var exploreVC: ExploreVC {
        let storyboard = UIStoryboard.init(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ExploreVC") as! ExploreVC
        return vc
    }
    
    private var tripVC: TripVC {
        let storyboard = UIStoryboard.init(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TripVC") as! TripVC
        return vc
    }
    
    private var profileVC: ProfileVC {
        let storyboard = UIStoryboard.init(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        return vc
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        object_setClass(self.tabBar, CustomHeightTabbar.self)
        
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = UIColor(named: "ThemeBgColor")
        self.tabBar.layer.borderWidth = 1
        self.tabBar.layer.borderColor = UIColor.lightGray.cgColor
        self.tabBar.unselectedItemTintColor = UIColor.darkGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewControllers = [
            homeVC,
            exploreVC,
            tripVC,
            profileVC
        ]
    }
    
}

//
//  HomeViewController.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 12/04/2024.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var btnPlane: UIButton!
    @IBOutlet weak var btnBed: UIButton!
    @IBOutlet weak var btnCar: UIButton!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
                                            
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        tabBarItem = UITabBarItem.init(title: "Search", image: UIImage.init(systemName: "magnifyingglass")?.withRenderingMode(.alwaysOriginal), tag: 1)
    }
                                            
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        setUpBindings()
    }
    
    private func setUpViews() {
        
    }
    
    private func setUpBindings() {
        btnPlane.addTarget(self, action: #selector(onTapPlane), for: .touchUpInside)
        btnBed.addTarget(self, action: #selector(onTapBed), for: .touchUpInside)
        btnCar.addTarget(self, action: #selector(onTapCar), for: .touchUpInside)
    }
    
    @objc func onTapPlane() {
        btnPlane.backgroundColor = UIColor(named: "ThemeBgColor")
    }
    
    @objc func onTapBed() {
        
    }
    
    @objc func onTapCar() {
        
    }
}

//
//  HomeVC.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 30/03/2024.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var tblRegion: UITableView!
    @IBOutlet weak var tblRegionHeight: NSLayoutConstraint!
    @IBOutlet weak var btnMoreOptions: UIButton!
    @IBOutlet weak var btnContinue: UIButton!
    
    private lazy var vm: WelcomeVM = WelcomeVM.init(delegate: self)
    
    private var initialVisibleItem: Int = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        setUpBindings()
        vm.getAll()
    }
    
    override func viewWillLayoutSubviews() {
        updateTableViewHeight()
    }
    
    func setUpViews() {
        tblRegion.register(UINib.init(nibName: "RegionCell", bundle: nil), forCellReuseIdentifier: "RegionCell")
        tblRegion.dataSource = self
        tblRegion.delegate = self
        tblRegion.separatorStyle = .none
    }
    
    func setUpBindings() {
        btnMoreOptions.addTarget(self, action: #selector(onTapMoreOptions), for: .touchUpInside)
        btnContinue.addTarget(self, action: #selector(onTapContinue), for: .touchUpInside)
    }
    
    @objc func onTapMoreOptions() {
        initialVisibleItem = initialVisibleItem == 2 ? vm.regions.count : 2
        btnMoreOptions.setTitle(initialVisibleItem == 2 ? "More options" : "Less options" , for: .normal)
        self.tblRegion.reloadData()
        updateTableViewHeight()
        print(initialVisibleItem)
    }
    
    @objc func onTapContinue() {
        let tabBarVC = TabbarVC.init()
        self.navigationController?.pushViewController(tabBarVC, animated: true)
    }
    
    func updateTableViewHeight() {
        self.tblRegionHeight.constant = self.tblRegion.contentSize.height
    }
}

extension WelcomeVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return min(vm.regions.count, initialVisibleItem)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblRegion.dequeueReusableCell(withIdentifier: "RegionCell") as? RegionCell
        guard let cell = cell
        else {
            return UITableViewCell.init()
        }
        cell.data = vm.regions[indexPath.row]
        return cell
    }
}

extension WelcomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension WelcomeVC: WelcomeViewDelegate {
    
    func onGetRegions() {
        
    }
}


//
//  HomeVC.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 30/03/2024.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var tblRegion: UITableView!
    
    private let regions: [Region] = Region.getDummyData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tblRegion.register(UINib.init(nibName: "RegionCell", bundle: nil), forCellReuseIdentifier: "RegionCell")
        tblRegion.dataSource = self
        tblRegion.delegate = self
    }
    
    func setUpViews() {
        
    }
    
    func setUpBindings() {
        
    }
}

extension WelcomeVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblRegion.dequeueReusableCell(withIdentifier: "RegionCell") as? RegionCell
        guard let cell = cell
        else {
            return UITableViewCell.init()
        }
        cell.data = regions[indexPath.row]
        return cell
    }
    
}

extension WelcomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

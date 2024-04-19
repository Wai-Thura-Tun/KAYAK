//
//  FlightListVC.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 16/04/2024.
//

import UIKit

class FlightListVC: UIViewController {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnSortDate: UIButton!
    @IBOutlet weak var btnStop: UIButton!
    @IBOutlet weak var btnTime: UIButton!
    @IBOutlet weak var btnAirline: UIButton!
    @IBOutlet weak var tbFlightList: UITableView!
    
    private lazy var vm: FlightListVM = FlightListVM.init(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        setUpBindings()
        vm.getFlightLists()
    }
    
    private func setUpViews() {
        [btnSortDate, btnStop, btnTime, btnAirline].addBorder(color: UIColor.lightGray.cgColor, width: 1)
        tbFlightList.register(UINib.init(nibName: "FlightCell", bundle: nil), forCellReuseIdentifier: "FlightCell")
        tbFlightList.dataSource = self
        tbFlightList.delegate = self
        tbFlightList.separatorStyle = .none
    }
    
    private func setUpBindings() {
        
    }
    
}

extension FlightListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.flights.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlightCell") as? FlightCell
        guard let cell = cell else { return UITableViewCell.init() }
        cell.data = vm.flights[indexPath.row]
        cell.isBestCheapViewHidden = indexPath.row > 0 ? true : false
        cell.delegate = self
        return cell
    }
}

extension FlightListVC: UITableViewDelegate {
    
}

extension FlightListVC: FlightListViewDelegate {
    func onGetFlightLists() {
        tbFlightList.reloadData()
    }
}

extension FlightListVC: FlightCellDelegate {
    func onTapSave(data: Flight) {
        vm.toggleSaveStatus(flightId: data.id)
    }
}

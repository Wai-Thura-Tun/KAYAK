//
//  FlightDetailVC.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 16/04/2024.
//

import UIKit

class FlightDetailVC: UIViewController {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var imgAirline: UIImageView!
    @IBOutlet weak var lblDepartArrival: UILabel!
    @IBOutlet weak var lblTraveler: UILabel!
    @IBOutlet weak var tbSite: UITableView!
    @IBOutlet weak var tbSiteHeight: NSLayoutConstraint!
    @IBOutlet weak var btnMoreSite: UIButton!
    @IBOutlet weak var lblArrivalDepart: UILabel!
    @IBOutlet weak var lblDateDuration: UILabel!
    @IBOutlet weak var imgFlight: UIImageView!
    @IBOutlet weak var lblFlightNo: UILabel!
    @IBOutlet weak var lblDepartShort: UILabel!
    @IBOutlet weak var lblArrivalShort: UILabel!
    @IBOutlet weak var lblDepartTime: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var lblArrivalTime: UILabel!
    @IBOutlet weak var lblDepartLong: UILabel!
    @IBOutlet weak var lblArrivalLong: UILabel!
    
    var flightId: Int?
    
    private lazy var vm: FlightDetailVM = FlightDetailVM.init(delegate: self)
    
    private var initialVisibleItem: Int = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        setUpBindings()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.tbSiteHeight.constant = self.tbSite.contentSize.height
    }
    
    private func setUpViews() {
        btnSave.setTitle(" Save", for: .normal)
        vm.getFlightById(flightId: flightId ?? 1)
        tbSite.register(UINib.init(nibName: "SiteCell", bundle: nil), forCellReuseIdentifier: "SiteCell")
        tbSite.dataSource = self
        tbSite.delegate = self
        tbSite.separatorStyle = .none
    }
    
    private func setUpBindings() {
        btnBack.addTarget(self, action: #selector(onTapBack), for: .touchUpInside)
        btnSave.addTarget(self, action: #selector(onTapSave), for: .touchUpInside)
        btnMoreSite.addTarget(self, action: #selector(onTapMoreSite), for: .touchUpInside)
    }
    
    private func bindData() {
        guard let flight = vm.flight else { return }
        imgAirline.image = UIImage(named: flight.airlineImgUrl)
        lblDepartArrival.text = "\(flight.departShortName) - \(flight.arrivalShortName)"
        lblTraveler.text = "\(flight.sites.count)/\(flight.sites.count), \(flight.numOfTraveler) Traveler"
        lblArrivalDepart.text = "\(flight.departShortName) - \(flight.arrivalShortName)"
        lblDateDuration.text = "\(flight.departDateTime?.toString(with: "EEEE, MMMM d") ?? "") \(flight.departDateTime.calculateDuration(to: flight.arrivalDateTime) ?? "") . \(flight.isNonStop ? "nonestop" : "onestop")"
        imgFlight.image = UIImage(named: flight.airlineImgUrl)
        lblFlightNo.text = "\(flight.airlineName) \(flight.flightNo)"
        lblDepartShort.text = flight.departShortName
        lblArrivalShort.text = flight.arrivalShortName
        lblDepartTime.text = flight.departDateTime.convertDateFormat()
        lblDuration.text = flight.departDateTime.calculateDuration(to: flight.arrivalDateTime)
        lblArrivalTime.text = flight.arrivalDateTime.convertDateFormat()
        lblDepartLong.text = flight.departLongName
        lblArrivalLong.text = flight.arrivalLongName
        btnSave.setImage(UIImage(systemName: flight.isSaved ? "heart.fill" : "heart"), for: .normal)
    }
    
    @objc func onTapBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func onTapSave() {
        vm.toggleSaveStatus()
    }
    
    @objc func onTapMoreSite() {
        initialVisibleItem = initialVisibleItem == 3 ? vm.flight?.sites.count ?? 0 : 3
        btnMoreSite.setTitle(initialVisibleItem == 3 ? "\(vm.flight?.sites.count ?? 0 - initialVisibleItem) more deals from $\(Int(vm.flight?.sites[3].price ?? 0))" : "Show less", for: .normal)
        tbSite.reloadData()
        tbSiteHeight.constant = tbSite.contentSize.height
    }
}
extension FlightDetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return min(initialVisibleItem, vm.flight?.sites.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SiteCell") as? SiteCell
        guard let cell = cell else { return UITableViewCell.init() }
        cell.data = vm.flight?.sites[indexPath.row]
        return cell
    }
}

extension FlightDetailVC: UITableViewDelegate {
    
}

extension FlightDetailVC: FlightDetailViewDelegate {
    func onGetFlightDetail() {
        bindData()
    }
}

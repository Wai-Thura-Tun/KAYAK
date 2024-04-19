//
//  FlightVC.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 16/04/2024.
//

import UIKit

class FlightSearchVC: UIViewController {

    @IBOutlet weak var arrivalView: UIView!
    @IBOutlet weak var departureView: UIView!
    @IBOutlet weak var btnSwitchLocation: UIButton!
    @IBOutlet weak var btnTraveler: UIButton!
    @IBOutlet weak var btnEconomy: UIButton!
    @IBOutlet weak var btnCarryOn: UIButton!
    @IBOutlet weak var btnStopNonStop: UIButton!
    @IBOutlet weak var tfArrival: UITextField!
    @IBOutlet weak var tfDeparture: UITextField!
    @IBOutlet weak var tfDate: UITextField!
    @IBOutlet weak var btnSearchFlight: UIButton!
    
    private var isSearchFlightEnabled: Bool = false {
        didSet {
            btnSearchFlight.isEnabled = isSearchFlightEnabled
            btnSearchFlight.backgroundColor = isSearchFlightEnabled ? UIColor.systemIndigo : UIColor.systemGray
        }
    }
    
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker.init()
        let date = Date.init()
        datePicker.datePickerMode = .date
        datePicker.minimumDate = date
        datePicker.maximumDate = Calendar.current.date(byAdding: .month, value: 2, to: date, wrappingComponents: true)
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        return datePicker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        setUpBindings()
    }
    

    private func setUpViews() {
        departureView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        arrivalView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        [btnSwitchLocation].addBorder(color: UIColor.white.cgColor, width: 1)
        [btnTraveler, btnEconomy, btnCarryOn, btnStopNonStop].addBorder(color: UIColor.lightGray.cgColor, width: 1)
        tfDate.inputView = datePicker
        tfDate.text = Date.init().toString()
        isSearchFlightEnabled = false
    }
    
    private func setUpBindings() {
        tfArrival.addCancelButtonToKeyboard(action: #selector(onTapArrival), target: self)
        tfDeparture.addCancelButtonToKeyboard(action: #selector(onTapDeparture), target: self)
        tfDate.addCancelButtonToKeyboard(action: #selector(onTapDate), target: self)
        [tfArrival, tfDeparture].addTarget(action: #selector(onValidate))
        datePicker.addTarget(self, action: #selector(onDateChange), for: .valueChanged)
        btnSwitchLocation.addTarget(self, action: #selector(onTapSwitchLocation), for: .touchUpInside)
        btnSearchFlight.addTarget(self, action: #selector(onTapSearchFlight), for: .touchUpInside)
    }

    @objc func onTapArrival() {
        tfArrival.resignFirstResponder()
    }
    
    @objc func onTapDeparture() {
        tfDeparture.resignFirstResponder()
    }
    
    @objc func onTapDate() {
        tfDate.resignFirstResponder()
    }
    
    @objc func onDateChange() {
        tfDate.text = datePicker.date.toString()
        onValidate()
    }
    
    @objc func onValidate() {
        guard let arrival = tfArrival.text, let depart = tfDeparture.text, let date = tfDate.text, !arrival.isEmpty, !depart.isEmpty, !date.isEmpty else {
            isSearchFlightEnabled = false
            return
        }
        isSearchFlightEnabled = true
    }
    
    @objc func onTapSwitchLocation() {
        let arrival = tfArrival.text ?? ""
        let depart = tfDeparture.text ?? ""
        tfDeparture.text = arrival
        tfArrival.text = depart
    }
    
    @objc func onTapSearchFlight() {
        let storyboard = UIStoryboard.init(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "FlightListVC") as? FlightListVC
        guard let vc = vc else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

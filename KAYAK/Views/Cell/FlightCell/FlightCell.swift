//
//  FlightCell.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 17/04/2024.
//

import UIKit

protocol FlightCellDelegate {
    func onTapSave(data: Flight)
}

class FlightCell: UITableViewCell {

    @IBOutlet weak var saveView: UIView!
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var bestCheapView: UIView!
    @IBOutlet weak var lblDepartTime: UILabel!
    @IBOutlet weak var lblArrivalTime: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var lblDepartPlace: UILabel!
    @IBOutlet weak var lblArrivalPlace: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblSite: UILabel!
    @IBOutlet weak var imgAirline: UIImageView!
    @IBOutlet weak var lblAirline: UILabel!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var vStop: UIView!
    
    var isBestCheapViewHidden: Bool = false {
        didSet {
            bestCheapView.isHidden = isBestCheapViewHidden
        }
    }
    
    var delegate: FlightCellDelegate? = nil
    
    var data: Flight? {
        didSet {
            if let data = data {
                lblDepartTime.text = convertDateFormat(date: data.departDateTime)
                lblDepartPlace.text = data.departShortName
                lblArrivalTime.text = convertDateFormat(date: data.arrivalDateTime)
                lblArrivalPlace.text = data.arrivalShortName
                lblPrice.text = "$\(Int(data.price))"
                lblAirline.text = data.airlineName
                imgAirline.image = UIImage(named: data.airlineImgUrl)
                lblSite.text = "\(data.sites.count) sites"
                vStop.isHidden = !data.isNonStop
                lblDuration.text = calculateDuration(startDate: data.departDateTime, endDate: data.arrivalDateTime)
                btnSave.setImage(UIImage(named: data.isSaved ? "save" : "unsave"), for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
        priceView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        saveView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        btnSave.addTarget(self, action: #selector(onTapSave), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func convertDateFormat(date: Date?) -> String {
        var dateString = date?.toString(with: "h:mma")
        let amPm = dateString?.suffix(2)
        dateString = dateString?.replacingOccurrences(of: amPm ?? "", with: "")
        return "\(dateString ?? "")\(amPm?.prefix(1).lowercased() ?? "")"
    }
    
    func calculateDuration(startDate: Date? , endDate: Date?) -> String? {
        guard let startDate = startDate, let endDate = endDate else { return nil }
        let calendar = Calendar.current
        let dateComponet = calendar.dateComponents([.hour, .minute], from: startDate, to: endDate)
        let hour = dateComponet.hour ?? 0
        let minute = dateComponet.minute ?? 0
        return "\(hour)h\(minute > 0 ? " \(minute)m" : "")"
    }
    
    @objc func onTapSave() {
        guard let data = data else { return }
        delegate?.onTapSave(data: data)
    }
}



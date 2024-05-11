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
    @IBOutlet weak var vOneStop: UIView!
    @IBOutlet weak var vNoneStop: UIView!
    
    var isBestCheapViewHidden: Bool = false {
        didSet {
            bestCheapView.isHidden = isBestCheapViewHidden
        }
    }
    
    var delegate: FlightCellDelegate? = nil
    
    var data: Flight? {
        didSet {
            if let data = data {
                lblDepartTime.text = data.departDateTime.convertDateFormat()
                lblDepartPlace.text = data.departShortName
                lblArrivalTime.text = data.arrivalDateTime.convertDateFormat()
                lblArrivalPlace.text = data.arrivalShortName
                lblPrice.text = "$\(Int(data.price))"
                lblAirline.text = data.airlineName
                imgAirline.image = UIImage(named: data.airlineImgUrl)
                lblSite.text = "\(data.sites.count) sites"
                vOneStop.isHidden = data.isNonStop
                vNoneStop.isHidden = !data.isNonStop
                lblDuration.text = data.departDateTime.calculateDuration(to: data.arrivalDateTime)
                btnSave.setImage(UIImage(systemName: data.isSaved ? "heart.fill" : "heart"), for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
        //btnSave.addTarget(self, action: #selector(onTapSave), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func onTapSave() {
        guard let data = data else { return }
        delegate?.onTapSave(data: data)
    }
}



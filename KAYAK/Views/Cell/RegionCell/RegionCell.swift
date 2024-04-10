//
//  RegionCell.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 30/03/2024.
//

import UIKit

class RegionCell: UITableViewCell {

    @IBOutlet weak var imgRegionFlag: UIImageView!
    @IBOutlet weak var lblRegionStatus: UILabel!
    @IBOutlet weak var lblRegionName: UILabel!
    @IBOutlet weak var lblRegionWeb: UILabel!
    @IBOutlet weak var lblRegionMoney: UILabel!
    
    var data: Region? = nil {
        didSet {
            if let data = data {
                self.imgRegionFlag.image = UIImage(named: data.flagUrl)
                self.lblRegionStatus.text = "Current Region"
                self.lblRegionName.text = data.name
                self.lblRegionWeb.text = data.website
                self.lblRegionMoney.text = data.moneyType
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

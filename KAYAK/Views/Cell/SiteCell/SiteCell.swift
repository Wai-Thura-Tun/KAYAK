//
//  SiteCell.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 19/04/2024.
//

import UIKit

class SiteCell: UITableViewCell {

    @IBOutlet weak var lblSiteName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    var data: Site? {
        didSet {
            if let data = data {
                lblSiteName.text = data.name
                lblPrice.text = "$\(Int(data.price))"
                print(data.name)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

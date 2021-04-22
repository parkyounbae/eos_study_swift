//
//  TableViewCell.swift
//  Weather
//
//  Created by 박윤배 on 2021/04/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet var countryName:UILabel!
    @IBOutlet var countryImg: UIImageView!
    var countryTicker: String?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  SecondCustomTableViewCell.swift
//  Weather
//
//  Created by 박윤배 on 2021/04/22.
//

import UIKit

class SecondCustomTableViewCell: UITableViewCell {
    
    @IBOutlet var currentWeather: UIImageView!
    @IBOutlet var cityName: UILabel!
    @IBOutlet var currentCelcius: UILabel!
    @IBOutlet var currentPercent: UILabel!
    var weatherTicker: Int!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

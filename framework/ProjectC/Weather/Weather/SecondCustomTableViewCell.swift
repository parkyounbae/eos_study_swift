//
//  SecondCustomTableViewCell.swift
//  Weather
//
//  Created by 박윤배 on 2021/04/22.
//

import UIKit

class SecondCustomTableViewCell: UITableViewCell {
    
    
    //내가 셀을 커스텀 셀로 지정해 두었고 안에 있는 요소들에 편하게 접근하기 위해 이런 클래스가 필요
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

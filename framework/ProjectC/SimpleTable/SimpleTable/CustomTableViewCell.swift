//
//  CustomTableViewCell.swift
//  SimpleTable
//
//  Created by 박윤배 on 2021/04/21.
//

import UIKit
//셀 안에 있는 레이블에 접근을 쉽게 하기 위해 이 클래스를 생성
class CustomTableViewCell: UITableViewCell {

    @IBOutlet var leftLabel: UILabel!
    @IBOutlet var rightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

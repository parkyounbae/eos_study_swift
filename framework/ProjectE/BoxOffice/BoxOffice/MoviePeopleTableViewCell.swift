//
//  MoviePeopleTableViewCell.swift
//  BoxOffice
//
//  Created by 박윤배 on 2021/05/24.
//

import UIKit

class MoviePeopleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var actorLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

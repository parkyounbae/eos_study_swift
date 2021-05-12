//
//  MovieTableViewCell.swift
//  BoxOffice
//
//  Created by 박윤배 on 2021/05/12.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieOpen: UILabel!
    @IBOutlet weak var movieTicker: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

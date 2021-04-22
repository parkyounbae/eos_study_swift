//
//  ThirdViewController.swift
//  Weather
//
//  Created by 박윤배 on 2021/04/22.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var weather: UILabel!
    @IBOutlet var ondo: UILabel!
    @IBOutlet var per: UILabel!
    
    
    var countryName: String?
    var cityName: String?
    var state: Int?
    var CNF: String?
    var percent: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = title
        self.navigationController?.navigationBar.topItem?.title = countryName

        // Do any additional setup after loading the view.
        switch state {
        case 10:
            imgView.image = UIImage(named: "sunny")
            weather.text = "맑음"
        case 11:
            imgView.image = UIImage(named: "cloudy")
            weather.text = "흐림"
        case 12:
            imgView.image = UIImage(named: "rainy")
            weather.text = "비"
        case 13:
            imgView.image = UIImage(named: "snowy")
            weather.text = "눈"
        default:
            imgView.image = UIImage(named: "sunny")
            weather.text = "에러"
        }
        
        ondo.text = CNF
        per.text = percent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.title = cityName
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

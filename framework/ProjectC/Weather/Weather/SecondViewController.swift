//
//  SecondViewController.swift
//  Weather
//
//  Created by 박윤배 on 2021/04/22.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var weatherInformations: [WeatherInformation] = []
    let customCellIdentifier: String = "cell"
    var cityName: String?
    var cityTicker: String?
    
    //마찬가지로 필수 메소드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherInformations.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SecondCustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.customCellIdentifier, for: indexPath) as! SecondCustomTableViewCell
        
        cell.cityName.text = self.weatherInformations[indexPath.row].cityName
        cell.currentCelcius.text = self.weatherInformations[indexPath.row].CNF
        cell.currentPercent.text = self.weatherInformations[indexPath.row].persentPersent
        //12:비 13:눈 11:구름 10:맑음
        switch self.weatherInformations[indexPath.row].state {
        case 10:
            cell.currentWeather.image = UIImage(named: "sunny")
            cell.weatherTicker = 10
        case 11:
            cell.currentWeather.image = UIImage(named: "cloudy")
            cell.weatherTicker = 11
        case 12:
            cell.currentWeather.image = UIImage(named: "rainy")
            cell.weatherTicker = 12
        case 13:
            cell.currentWeather.image = UIImage(named: "snowy")
            cell.weatherTicker = 13
        default:
            cell.currentWeather.image = UIImage(named: "sunny")
            cell.weatherTicker = 14
        }
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.topItem?.title = cityName
        self.title = cityName
        
        // Do any additional setup after loading the view.
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: cityTicker! )else{
            return
        }
        
        do{
            self.weatherInformations = try jsonDecoder.decode([WeatherInformation].self, from: dataAsset.data)
        } catch{
            print(error.localizedDescription)
        }
        
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.title = cityName
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        
        guard let nextViewController: ThirdViewController = segue.destination as? ThirdViewController else {
            return
        }
        
        guard let cell: SecondCustomTableViewCell = sender as? SecondCustomTableViewCell else{
            return
        }
        
        nextViewController.countryName = self.cityName
        nextViewController.cityName = cell.cityName.text
        nextViewController.CNF = cell.currentCelcius.text
        nextViewController.state = cell.weatherTicker
        nextViewController.percent = cell.currentPercent.text
    }
    

}

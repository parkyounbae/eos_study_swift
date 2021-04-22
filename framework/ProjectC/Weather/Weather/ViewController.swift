//
//  ViewController.swift
//  Weather
//
//  Created by 박윤배 on 2021/04/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var countries: [Countries] = []
    let customCellIdentifier: String = "cell"
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.customCellIdentifier, for: indexPath) as! CustomTableViewCell
            
        cell.countryName.text = self.countries[indexPath.row].koreanName
        let tempImg: UIImage? = UIImage(named: "flag_" + self.countries[indexPath.row].assetName)
        cell.countryImg.image = tempImg
        //todo 에셋 이름 지정
        cell.countryTicker = self.countries[indexPath.row].assetName
            
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "countries") else {
            return
        }
        
        do{
            self.countries = try jsonDecoder.decode([Countries].self, from: dataAsset.data)
        } catch{
            print(error.localizedDescription)
        }
        
        self.tableView.reloadData()
        
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        guard let nextViewController: SecondViewController = segue.destination as? SecondViewController else {
            return
        }
        
        guard let cell: CustomTableViewCell = sender as? CustomTableViewCell else{
            return
        }
        nextViewController.cityName = cell.countryName.text!
        nextViewController.cityTicker = cell.countryTicker
    }
    


}


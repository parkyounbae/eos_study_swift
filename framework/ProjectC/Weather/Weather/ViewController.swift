//
//  ViewController.swift
//  Weather
//
//  Created by 박윤배 on 2021/04/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var countries: [Countries] = [] //빈 배열을 생성
    let customCellIdentifier: String = "cell" //셀을 구분할수 있는 식별자를 지정해 준다. 각 클래스마다 작동하는듯?
    @IBOutlet weak var tableView: UITableView! //테이블뷰
    
    
    //이렇게 밑에 두개는 UITableViewDataSource, UITableViewDelegate 프로토콜의 필수 메소드
    //테이블 뷰에 셀이 몇개인지 전달해준다.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    //각 셀에 해당하는 정보를 삽입해준다.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.customCellIdentifier, for: indexPath) as! CustomTableViewCell
        //해당하는 식별자를 가진 셀을 큐에서 빼내준다.
            
        //내가 빼낸 셀에 원하는 정보들을 삽입, 순서는 indexPath.row를 통해서 조절
        cell.countryName.text = self.countries[indexPath.row].koreanName
        let tempImg: UIImage? = UIImage(named: "flag_" + self.countries[indexPath.row].assetName)
        cell.countryImg.image = tempImg
        cell.countryTicker = self.countries[indexPath.row].assetName
            
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //jsonDecoder를 통헤서 파일을 읽어드림
        let jsonDecoder: JSONDecoder = JSONDecoder()
        //여기서 name은 내가 읽으려고하는 json파일의 이름을 의미
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "countries") else {
            return
        }
        
        do{
            self.countries = try jsonDecoder.decode([Countries].self, from: dataAsset.data)
        } catch{
            print(error.localizedDescription)
        }
        
        self.tableView.reloadData() //읽은 데이터를 배열에 넣어준 다음 테이블뷰를 리로드
        
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
        
        //다음으로 넘어가는 과정에서 필요한 정보들을 넘겨준다.
        nextViewController.cityName = cell.countryName.text!
        nextViewController.cityTicker = cell.countryTicker
    }
    


}


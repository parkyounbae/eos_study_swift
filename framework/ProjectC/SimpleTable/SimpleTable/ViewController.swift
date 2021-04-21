//
//  ViewController.swift
//  SimpleTable
//
//  Created by 박윤배 on 2021/04/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    let custonnCellIdentifier: String = "customCell"
    
    let korean: [String] = ["가","나","다","라","마","바","사","아","자","차","카","타","파","하"]
    let english: [String] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","x","t","u","v","w","x","y","z"]
    var dates: [Date] = [] //추가할 데이트들의 배열 생성
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    let timeFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }()
    
    //추가버튼 클릭
    @IBAction func touchUpAddButton(_ sender: UIButton){
        dates.append(Date())
        print("clicked")
        //self.tableView.reloadData() //전체 섹션을 다시 불러온다. -> 비효율적
        self.tableView.reloadSections(IndexSet(2...2), with: UITableView.RowAnimation.automatic)
        
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
        //한글과 영어 두개의 섹션
    }
    
    //프로토콜 중 옵셔널이 아닌 것들은 곡 구현되어야 한다
    //UITableViewDataSource 에 있는 퍼블릭 메소드
    //tableView의 row가 몇개여야 하는지 알려주는 메서드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return korean.count
        case 1:
            return english.count
        case 2:
            return dates.count
        default:
            return 0
        }
    }
    
    //row마다 해당하는 cell을 돌려달라
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        
        if indexPath.section < 2 {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
            //셀을 만들어주고
            //셀의 내용을 세팅해준다
            let text: String = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
            //섹션이 0 이라면 korean, 아니면 english
            cell.textLabel?.text = text
            return cell
        }else{
            let cell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.custonnCellIdentifier, for: indexPath) as! CustomTableViewCell
            cell.leftLabel.text = self.dateFormatter.string(from: self.dates[indexPath.row])
            cell.rightLabel.text = self.timeFormatter.string(from: self.dates[indexPath.row])
            return cell
        }
    }
    
    //섹션마다 타이틀을 줄 수 있다.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section<2{
            return section==0 ? "korean" : "english"
        }
        return nil
    }

}


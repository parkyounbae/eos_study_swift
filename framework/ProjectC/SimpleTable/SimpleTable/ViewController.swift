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
    
    let korean: [String] = ["가","나","다","라","마","바","사","아","자","차","카","타","파","하"]
    let english: [String] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","x","t","u","v","w","x","y","z"]

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
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
        default:
            return 0
        }
    }
    
    //row마다 해당하는 cell을 돌려달라
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        //셀을 만들어주고
        
        //셀의 내용을 세팅해준다
        let text: String = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
        //섹션이 0 이라면 korean, 아니면 english
        cell.textLabel?.text = text
        
        //리턴
        return cell
    }
    
    //섹션마다 타이틀을 줄 수 있다.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section==0 ? "korean" : "english"
    }

}


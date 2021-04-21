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
       
        
        //셀을 계속 디큐해준다.... 화면에 보이지 않는 셀들은 재사용 큐에 집어넣고 셀을 불러올때 이 큐에서 디큐를 해준다 만약 재사용 큐가 비어있다면 새로운 셀을 생성해준다.
        if indexPath.section < 2 {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
            //셀을 만들어주고
            //셀의 내용을 세팅해준다
            let text: String = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
            //섹션이 0 이라면 korean, 아니면 english
            cell.textLabel?.text = text
            
            if indexPath.row==1{
                cell.backgroundColor = UIColor.red //셀이 재사용 되고 있음을 확인... else문을 설정하면 방지가능
            }
            
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
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        //segue.identifier
        //segue의 identifier를 통해 케이스 구분을 할수도 있다, 
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let nextViewController: SecondViewController = segue.destination as? SecondViewController else{
            return
        }
        guard let cell: UITableViewCell = sender as? UITableViewCell else {
            return
        }
        nextViewController.textToSet = cell.textLabel?.text
        //직접 텍스트 레이블에 접근해서 설정할수는 없다
        //아지 메모리에 올라와있지 않기 때문
        
        
    }
    //다음 뷰 컨트롤러도 가져올수도 있고 다음 뷰 컨트롤러에 원하는 정보를 전달할 수도 있다.

}


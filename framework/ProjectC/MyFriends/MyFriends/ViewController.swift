//
//  ViewController.swift
//  MyFriends
//
//  Created by 박윤배 on 2021/04/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    var friends: [Friend] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        let friend: Friend = self.friends[indexPath.row]
        cell.textLabel?.text = friend.nameAndAge
        cell.detailTextLabel?.text = friend.fullAddress
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //프렌즈 json파일 읽기
        let jsonDecoder:  JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "friends") else {
            return
        }
        do{
            self.friends = try jsonDecoder.decode([Friend].self, from: dataAsset.data)
        } catch{
            print(error.localizedDescription)
        }
        
        self.tableView.reloadData()
    }


}


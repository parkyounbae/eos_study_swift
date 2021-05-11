//
//  ViewController.swift
//  Networking
//
//  Created by 박윤배 on 2021/05/10.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "friendCell"
    var friends: [Friend] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        let friend: Friend = self.friends[indexPath.row]
        
        cell.textLabel?.text = friend.name.full
        cell.detailTextLabel?.text = friend.email
        cell.imageView?.image = nil //셀이 재사용 되기 전에 셀에 들어가 있는 이미지를 비워줘야한다.
        
        
        
        DispatchQueue.global().async {
            guard let imageURL: URL = URL(string: friend.picture.thumbnail) else { return }
            //이거는 지금 동기메서드임,, 그렇기 때문에 사진을 다운 받는 동안 화면이 멈춰있음;;
            //다운 받는거 까지는 백그라운드에서 하는데 이미지를 세팅해주는건 메인에서 해줘야 한다.
            guard let imageData: Data = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                //셀을 위 아래로 움직이면서 이미지ㅡㄹ 넣어줄 셀의 인덱스가 바뀔수가 있음 .. 그러므로 같을 때만 이미지를 삽입
                if let index: IndexPath = self.tableView.indexPath(for: cell) {
                    if index.row == indexPath.row {
                        cell.imageView?.image = UIImage(data: imageData)
                        
                        //레이아웃이 결정되어있지 않은 상황에서 이댜로 실행하면 사진이 안뜸;; 눌러줘야 뜨는 상황 발생
                        //이미지 브렌치에 플레이스 홀더를 넣어주는게 좋음
                        cell.setNeedsLayout()
                        cell.layoutIfNeeded()
                        
                    }
                }
            }
        }
       
        return cell
    }
    
    
    @objc func didRecieveFriendsNotification(_ noti: Notification){
        guard let friends: [Friend] = noti.userInfo?["friends"] as? [Friend] else {return}
        
        self.friends = friends
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //내가 노티를 받아오겠다고 말해줌
        NotificationCenter.default.addObserver(self, selector: #selector(self.didRecieveFriendsNotification(_:)), name: DidReceiveFriendsNotification, object: nil)
        //이 노티를 받으면 메서드를 실행하겠다고 등록
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
       requestFriends()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


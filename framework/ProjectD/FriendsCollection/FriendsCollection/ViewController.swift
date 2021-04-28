//
//  ViewController.swift
//  FriendsCollection
//
//  Created by 박윤배 on 2021/04/28.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let cellIdentifier: String = "cell"
    var friends: [Friend] = []
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FriendCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as! FriendCollectionViewCell
        
        let friend: Friend = self.friends[indexPath.item]
        
        cell.nameAgeLabel.text = friend.nameAndAge
        cell.adressLabel.text = friend.fulladress
        
        return cell
    }
    
    //셀렉션 뷰에 어떤 아이템을 선택하게 되면 셀의 수를 늘려줌
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //self.numberOfCell += 1
        collectionView.reloadData() //한개를 늘려주고 데이터 리로드
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


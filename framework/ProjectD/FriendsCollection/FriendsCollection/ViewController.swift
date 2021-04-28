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
        cell.adressLabel.text = friend.fullAddress
        
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
        
        let flowLayout: UICollectionViewFlowLayout
        flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) //셀 내의 섹션의 인셋을 0으로
        flowLayout.minimumInteritemSpacing = 10 //아이템간의 거리가 10보다는 크게
        flowLayout.minimumLineSpacing = 10 //줄 간의 거리가 10보다는 크게
        
        let halfWidth: CGFloat = UIScreen.main.bounds.width / 2.0 //화면에 2개씩 배치
        
        flowLayout.itemSize = CGSize(width: halfWidth - 30, height: 90)
        //예상사이즈 지정 -> 오토레이아웃에 따라 셀 사이즈가 변할 수 있기 때문
        
        self.collectionView.collectionViewLayout = flowLayout
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "friends") else {
            return
        }
        
        do{
            self.friends = try jsonDecoder.decode([Friend].self, from: dataAsset.data)
        } catch{
            print(error.localizedDescription)
        }
        
        self.collectionView.reloadData()
    }


}


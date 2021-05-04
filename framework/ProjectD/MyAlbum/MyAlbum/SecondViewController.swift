//
//  SecondViewController.swift
//  MyAlbum
//
//  Created by 박윤배 on 2021/05/03.
//

import UIKit
import Photos

class SecondViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var backBtn: UIBarButtonItem!
    @IBOutlet weak var selectBtn: UIBarButtonItem!
    @IBOutlet weak var shareBtn: UIBarButtonItem!
    @IBOutlet weak var sortBtn: UIBarButtonItem!
    @IBOutlet weak var removeBtn: UIBarButtonItem!
    @IBOutlet weak var photoCollectionView: UICollectionView!
    let selfIdentifier: String = "cell"
    
    var pictures: PHAssetCollection! //뒤에서 받아오기
    var albumName: String! //뒤에서 가져오기
    
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    let half: Double = Double(UIScreen.main.bounds.width/3 - 15)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: half, height: half)
        flowLayout.sectionInset = UIEdgeInsets.zero
        flowLayout.minimumLineSpacing = 20
        flowLayout.minimumInteritemSpacing = 20
        self.photoCollectionView.collectionViewLayout = flowLayout
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = albumName
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.estimatedAssetCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: PhotoCollectionViewCell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: selfIdentifier, for: indexPath) as? PhotoCollectionViewCell else{
            return UICollectionViewCell()
        }
        
        let assets = PHAsset.fetchAssets(in: pictures, options: nil)
        let asset = assets.object(at: indexPath.item)
        
        imageManager.requestImage(for: asset, targetSize: CGSize(width: half, height: half), contentMode: .aspectFill, options: nil, resultHandler: {img, _ in cell.imageView.image = img})
        
        return cell
    }
    

    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

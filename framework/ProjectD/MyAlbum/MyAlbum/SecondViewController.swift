//
//  SecondViewController.swift
//  MyAlbum
//
//  Created by 박윤배 on 2021/05/03.
//

import UIKit
import Photos

class SecondViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, PHPhotoLibraryChangeObserver {
    
    @IBOutlet weak var backBtn: UIBarButtonItem!
    @IBOutlet weak var selectBtn: UIBarButtonItem!
    @IBOutlet weak var shareBtn: UIBarButtonItem!
    @IBOutlet weak var sortBtn: UIBarButtonItem!
    @IBOutlet weak var removeBtn: UIBarButtonItem!
    @IBOutlet weak var photoCollectionView: UICollectionView!
    let selfIdentifier: String = "cell"
    
    var pictures: PHAssetCollection! //뒤에서 받아오기
    var albumName: String! //뒤에서 가져오기
    
    var imageToShare: [UIImage] = []
    var imageToDelete: [Int] = []
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    let half: Double = Double(UIScreen.main.bounds.width/3 - 15)
    var stop:Bool = false
    
    var myRightBarButton: UIBarButtonItem!

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
        
        myRightBarButton = UIBarButtonItem(title: "선택", style: .plain, target: self, action: #selector(clickchooseBtn(_:)))
        self.navigationItem.rightBarButtonItem = myRightBarButton
        
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
    

    @IBAction func clickBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clickchooseBtn(_ sender: Any) {
        self.stop = true
        //공유 삭제 버튼 활성화 하기
        //selectBtn.isEnabled = true
        shareBtn.isEnabled = true
        self.removeBtn.isEnabled = true
        navigationItem.title = "항목 선택"
        self.backBtn.isEnabled = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelbtAction(_:)))
        
        self.photoCollectionView.allowsMultipleSelection = true
        
    }
    
    @IBAction func cancelbtAction(_ sender: UIBarButtonItem) -> Void{
        self.stop = false
        //공유 삭제 버튼 활성화 하기
        self.navigationItem.rightBarButtonItem = myRightBarButton
        //selectBtn.isEnabled = false
        removeBtn.isEnabled = false
        shareBtn.isEnabled = false
        navigationItem.title = "선택"
        self.backBtn.isEnabled = true
        
        self.imageToDelete = [Int]()
        self.photoCollectionView.allowsMultipleSelection = false
        self.photoCollectionView.reloadData()
    }
    
    @IBAction func clickShareBtn(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func clickSortBtn(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func clickRemoveBtn(_ sender: Any) {
        var asset = [PHAsset]()
        let assets = PHAsset.fetchAssets(in: pictures, options: nil)
        for i in imageToDelete{
            asset.append(assets.object(at: i))
        }
        PHPhotoLibrary.shared().performChanges({PHAssetChangeRequest.deleteAssets(asset as NSFastEnumeration)}, completionHandler: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.alpha = 0.7
        collectionView.cellForItem(at: indexPath)?.backgroundColor = UIColor.black
        
        if !imageToDelete.contains(indexPath.item){
            imageToDelete.append(indexPath.item)
        }
        
        if !stop{
            guard let vc = storyboard?.instantiateViewController(identifier: "detailView") else{
                print("viewcontroller not found")
                return
            }
            
            let thirdvc: ThirdViewController = vc as! ThirdViewController
            
            let cell: PhotoCollectionViewCell = collectionView.cellForItem(at: indexPath) as! PhotoCollectionViewCell
            thirdvc.picture = cell.imageView.image
            
            let assets = PHAsset.fetchAssets(in: pictures, options: nil)
            thirdvc.asset = assets.object(at: indexPath.item)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.alpha = 1
        collectionView.cellForItem(at: indexPath)?.backgroundColor = UIColor.white
        
        let index: Int! = imageToDelete.firstIndex(of: indexPath.item)
        imageToDelete.remove(at: index)
        
    }
    
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        guard let changes = changeInstance.changeDetails(for: pictures) else{
            return
        }
        
        pictures = changes.objectAfterChanges
        
        OperationQueue.main.addOperation {
            self.photoCollectionView.reloadData()
        }
    }
    
}

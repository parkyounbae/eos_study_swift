//
//  ViewController.swift
//  MyAlbum
//
//  Created by 박윤배 on 2021/04/28.
//

import UIKit
import Photos

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var albumCollectionView: UICollectionView!
    var albums: [PHAssetCollection] = [] //앨범을 여기다가 저장, 배열로다가
    var fetchResult: PHFetchResult<PHAsset>!
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    let cellIdentifier: String = "cell"
    
    func requestCollection(){
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        let albumThumnail: PHFetchResult = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .smartAlbumUserLibrary, options: fetchOptions)
        
        //self.fetchResult = PHAsset.fetchAssets(in: cameraRollCollection, options: fetchOptions)
        //self.fetchResult = albumColection
    }
    
    private func prepareCollectionView() {
            self.albumCollectionView.dataSource = self
            self.albumCollectionView.delegate = self
            self.albumCollectionView.register(UINib.init(nibName: "AlbumCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AlbumCollectionViewCell")
        }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count //앨범의 갯수만큼 셀을 생성하겠다
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: AlbumCollectionViewCell = albumCollectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as! AlbumCollectionViewCell
        //문제는 해당하는 phassetcollection에서 첫번째 asset을 꺼내오는 것... 이게 어케하는지 머르겠디...
        
        return cell
        
//        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
//
//        let asset: PHAsset = fetchResult.object(at: indexPath.row)
//        //index에 해당하는 사진을
//        imageManager.requestImage(for: asset, targetSize: CGSize(width: 30, height: 30), contentMode: .aspectFill, options: nil, resultHandler: {image, _ in cell.imageView?.image = image})
//        //이미지 매니저를 통해 이미지를 요청함. 셀에 들어갈 사이즈로 작게, 가져온 뒤 셀에 이미지 넣어줌
//
//        return cell
//    }
    }
    
    func chexkAuthhorizationStatus(){
        let photoAurhorizationStatus = PHPhotoLibrary.authorizationStatus()
        
        switch photoAurhorizationStatus {
        case .authorized:
            print("접근 허가")
            self.requestCollection()
            self.albumCollectionView.reloadData()
        case .denied:
            print("접근 불가")
        case .notDetermined:
            print("응답 없음")
            PHPhotoLibrary.requestAuthorization({ (status) in
                switch status {
                case .authorized:
                    print("사용자가 허용함")
                    self.requestCollection()
                    
                    OperationQueue.main.addOperation {
                        self.albumCollectionView.reloadData()
                    }
                case .denied:
                    print("사용자가 거절함")
                default: break
                }
            })
        case .restricted:
            print("접근 제한")
        case .limited:
            print("limited")
        @unknown default:
            fatalError()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.prepareCollectionView()
    }


}


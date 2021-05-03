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
    let numberOfItemsInRow = 2
    
    let half: Double = Double(UIScreen.main.bounds.width/2 - 20)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.prepareCollectionView()
        
        let flowLayout = UICollectionViewFlowLayout()
        let heightSize: Double = half + 40
        flowLayout.itemSize = CGSize(width: half, height: heightSize)
        
        flowLayout.sectionInset = UIEdgeInsets.zero
        flowLayout.minimumLineSpacing = 40
        flowLayout.minimumInteritemSpacing = 20
        self.albumCollectionView.collectionViewLayout = flowLayout
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.checkAuthhorizationStatus()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    
    
    
    func requestCollection(){
        print("requestionCollection 들어왔어!")
        
        let albumResult: PHFetchResult = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .smartAlbumUserLibrary, options: nil)
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        print("requestionCollection 들어왔어!2")
        albumResult.enumerateObjects({ (collection, _, _) in
            if (self.checkCollectionEmpty(collection)) {
                self.albums.append(collection)
                print("append")
            }
        })
    }
    
    func checkCollectionEmpty(_ collectionViewFromRequestColection: PHAssetCollection) -> Bool{
        let assets = PHAsset.fetchAssets(in: collectionViewFromRequestColection, options: nil)
        return assets.count > 0
    }
    
//    private func prepareCollectionView() {
//            self.albumCollectionView.dataSource = self
//            self.albumCollectionView.delegate = self
//            self.albumCollectionView.register(UINib.init(nibName: "cell", bundle: nil), forCellWithReuseIdentifier: "cell")
//        }
//
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count //앨범의 갯수만큼 셀을 생성하겠다
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: AlbumCollectionViewCell = albumCollectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as! AlbumCollectionViewCell
        //문제는 해당하는 phassetcollection에서 첫번째 asset을 꺼내오는 것... 이게 어케하는지 머르겠디...
        
        let assets = PHAsset.fetchAssets(in: albums[indexPath.item], options: nil)
        guard let asset = assets.firstObject else {
            print("셀 리턴 실패")
            return cell
        }
        
        imageManager.requestImage(for: asset, targetSize: CGSize(width: 30, height: 30), contentMode: .aspectFill, options: nil, resultHandler: {image, _ in cell.albumThumImageView?.image = image})
        cell.albumNameLabel.text = albums[indexPath.item].localizedTitle!
        cell.albumCountLabel.text = "\(albums[indexPath.item].estimatedAssetCount)"
        
        print("셀 리턴")
        return cell
    }
    
    func checkAuthhorizationStatus(){
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
}

//MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (Int(UIScreen.main.bounds.size.width) - (numberOfItemsInRow - 1) * 10 - 40) / numberOfItemsInRow
        return CGSize(width: width, height: width + 36)
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let photosViewController = UIStoryboard.main.instantiateViewController(withIdentifier: "PhotosViewController") as! PhotosViewController
//        let album = albums[indexPath.row]
//        photosViewController.title = album.localizedTitle
//        photosViewController.selectedCollection = album
//        self.navigationController?.pushViewController(photosViewController, animated: true)
//    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        // 넘겨줘야 할 것 ... 내가 선택한 셀의 ASSET보내기, 앨범 이름
        
        
    }
    
}



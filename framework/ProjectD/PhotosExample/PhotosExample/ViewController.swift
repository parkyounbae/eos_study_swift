//
//  ViewController.swift
//  PhotosExample
//
//  Created by 박윤배 on 2021/04/24.
//

import UIKit
import Photos

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, PHPhotoLibraryChangeObserver {
    
    @IBOutlet weak var tableView: UITableView! //가져온 사진 목록을 테이블 뷰에
    var fetchResult: PHFetchResult<PHAsset>!
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    let cellIdentifier: String = "cell"
    
    //어떤 로우를 우리가 편집할 수 있게 할 것인가
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{ //삭제할 것인가
            let asset: PHAsset = self.fetchResult[indexPath.row]
            
            PHPhotoLibrary.shared().performChanges({PHAssetChangeRequest.deleteAssets([asset] as NSArray)}, completionHandler: nil)
            //에셋을 딜리트 해줌
        }
    }
    
    //PHPhotoLibraryChangeObserver의 메서드 ... 포토라이브러리가 바뀌면 호출되는 메서드
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        guard let changes = changeInstance.changeDetails(for: fetchResult)
        else { return }
        
        fetchResult = changes.fetchResultAfterChanges
        //어떤게 바뀌였는지
        
        OperationQueue.main.addOperation {
            self.tableView.reloadSections(IndexSet(0...0), with: .automatic)
            //바꼈으면 이제 테이블 뷰를 다시 불러달라
        }
    }
    
    func requestCollection(){
        let cameraRoll: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
        //사진 찍으면 저장되는 그 카메라 롤을 가져옴
        
        guard let cameraRollCollection = cameraRoll.firstObject else {
            return
        }
        
        let fetchOptions = PHFetchOptions() //사진들을 가져오고
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)] //최신순으로 정렬
        self.fetchResult = PHAsset.fetchAssets(in: cameraRollCollection, options: fetchOptions) //그 결과를 저 프로퍼티에 저장
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //뷰를 불러온 다음에 사진에 대한 접근 허가 여부를 판단한다.
        let photoAurhorizationStatus = PHPhotoLibrary.authorizationStatus()
        
        switch photoAurhorizationStatus {
        case .authorized:
            print("접근 허가")
            self.requestCollection()
            self.tableView.reloadData()
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
                        self.tableView.reloadData()
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
        
        PHPhotoLibrary.shared().register(self)
        //포토 라이브러리가 변화될때마다 델리게이트 메서드가 호출됨
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fetchResult?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        let asset: PHAsset = fetchResult.object(at: indexPath.row)
        //index에 해당하는 사진을
        imageManager.requestImage(for: asset, targetSize: CGSize(width: 30, height: 30), contentMode: .aspectFill, options: nil, resultHandler: {image, _ in cell.imageView?.image = image})
        //이미지 매니저를 통해 이미지를 요청함. 셀에 들어갈 사이즈로 작게, 가져온 뒤 셀에 이미지 넣어줌
        
        return cell
    }


}


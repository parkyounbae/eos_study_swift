//
//  ViewController.swift
//  AsycnExample
//
//  Created by 박윤배 on 2021/04/27.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func touchUpDownloadButton(_ sender: UIButton){
        //image download -> set at imageView
        
        //https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/LARGE_elevation.jpg/1600px-LARGE_elevation.jpg
        let imageURL: URL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/LARGE_elevation.jpg/1600px-LARGE_elevation.jpg")!
        
        OperationQueue().addOperation{
            let imageData: Data = try! Data.init(contentsOf: imageURL) //동기메서드 ... 이 작업이 끝나기 전까지는 다음으로 넘어가지 않는다.
            let image: UIImage = UIImage(data: imageData)!
            
            self.imageView.image = image
        }
        
        /* 안전하게 하기
         @IBAction func touchUpDownloadButton(_ sender: UIButton) {
         guard let imageURL: URL = URL(string: "복사한 이미지주소")
         else {return}
         do {
         let imageData: Data = try Data.init(contentsOf: imageURL)
         guard let image: UIImage = UIImage(data: imageData)
         else {return}
         self.imageView.image = image
         }
         catch {
         return
         }
         }
         */
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


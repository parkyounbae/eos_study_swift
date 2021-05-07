//
//  ThirdViewController.swift
//  MyAlbum
//
//  Created by 박윤배 on 2021/05/07.
//

import UIKit
import Photos

class ThirdViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var asset: PHAsset!
    var picture: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 3.0
        imageView.image = picture
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
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

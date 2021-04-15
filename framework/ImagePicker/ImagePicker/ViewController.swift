//
//  ViewController.swift
//  ImagePicker
//
//  Created by 박윤배 on 2021/04/15.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    lazy var imagePicker : UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        //뷰 컨트롤러가 picker의 델리게이트 역할을 할 것이다 라고 명시
        //옵션 누르고 delegate누으면 프로토콜 확인 가능
        return picker
    }()
    
    //이미지 피커가 한 일을 우리가 전달받기 위해서는 델리게이트를 활용해야 한다.
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func touchUpSelectImageButton(_ sender: UIButton){
        self.present(self.imagePicker, animated: true, completion: nil)
        //모달 올리기
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //문서를 보면 키를 통해 딕셔너리에 있는 들어온 정보를 볼수 있다고 써있다.
        if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = originalImage
        }
        //이미지 피커가 어떤 일이 일어났을 때 이 메서드를 호출함
        //왜냐고? 위임했으니까
        
        self.dismiss(animated: true, completion: nil)
        //선택 완료 했으니까 모달 내려주기
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
        //취소했으니까 그냥 모달을 내려주기
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


//
//  UserInformationViewController.swift
//  SignUp
//
//  Created by 박윤배 on 2021/04/19.
//

import UIKit

class UserInformationViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordCheckField: UITextField!
    @IBOutlet weak var selfIntroduceField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    
    @IBOutlet weak var imageView: UIImageView!{
        didSet {
            imageView.isUserInteractionEnabled = true
        }
    }
    
    @IBAction func imageTapGesture(_ sender: UITapGestureRecognizer){
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func tapView(_ sender: UIGestureRecognizer){
        self.view.endEditing(true)
        //todo
        print("tap")
    }
    
    //텍스트필드가 수정될때마다 호출해야할거 같다
    //모든 필드가 채워져 있고 비번 두 칸이 같을 때 가입버튼 활성
    
    private func textFieldDidEndEditing(_ textView: UITextView) {
        guard let password = passwordField.text, let passwordCheck = passwordCheckField.text, password==passwordCheck, !(idField.text?.isEmpty ?? true), !(selfIntroduceField.text?.isEmpty ?? true) else{
            print("비밀번호 불일치")
            nextButton.isEnabled = false
            return
        }
        print("비밀번호 일치")
        nextButton.isEnabled = true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let password = passwordField.text, let passwordCheck = passwordCheckField.text, password==passwordCheck, !(idField.text?.isEmpty ?? true), !(selfIntroduceField.text?.isEmpty ?? true) else{
            print("비밀번호 불일치")
            nextButton.isEnabled = false
            return
        }
        print("비밀번호 일치")
        nextButton.isEnabled = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.imageView.image = originalImage
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func popToPrev(){
        self.navigationController?.popViewController(animated: true)
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

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
    
    //MARK: ImagePicker Set
    //이미지 피커 생성
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.imageView.image = originalImage
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
   
    //MARK: TextField Set
    //텍스트필드의 수정이 끝났을 때
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
    
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //만약 저장된 싱글톤이 있다면 채워주기
        guard let id = UserInformation.shared.id, let pw = UserInformation.shared.password, let si = UserInformation.shared.selfIntroduce else {
            return
        }
        idField.text = id
        passwordField.text = pw
        selfIntroduceField.text = si
    }
    
    //MARK:Action
    //이미지 버튼을 유저 인터렉션 가능하게 설정
    @IBOutlet weak var imageView: UIImageView!{
        didSet {
            imageView.isUserInteractionEnabled = true
        }
    }
    
    //이미지 뷰에 먹여놓은 제스쳐레코나이져 불렸을때
    @IBAction func imageTapGesture(_ sender: UITapGestureRecognizer){
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    //빈 공간 탭 했을때
    @IBAction func tapView(_ sender: UIGestureRecognizer){
        self.view.endEditing(true)
        //todo
        print("tap")
    }
    
    @IBAction func popToPrev(){
        self.navigationController?.popViewController(animated: true)
        
        //취소버튼이니까 삭제헤버리기
        UserInformation.shared.id = nil
        UserInformation.shared.password = nil
        UserInformation.shared.selfIntroduce = nil
        UserInformation.shared.phoneNum = nil
        UserInformation.shared.birthday = nil
    }
    
    //다음 버튼 눌렀을 때 싱글톤 저장
    @IBAction func nextButtonSingleton(_ sender: Any) {
        UserInformation.shared.id = idField.text
        UserInformation.shared.password = passwordField.text
        UserInformation.shared.selfIntroduce = selfIntroduceField.text
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

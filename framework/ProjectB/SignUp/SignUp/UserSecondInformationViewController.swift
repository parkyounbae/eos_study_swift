//
//  UserSecondInformationViewController.swift
//  SignUp
//
//  Created by 박윤배 on 2021/04/20.
//

import UIKit

class UserSecondInformationViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var finishBtn: UIButton!
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker){
        let date: Date = self.datePicker.date
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.dateLabel.text = dateString
        UserInformation.shared.birthday = dateString
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let pNum = phoneField.text else{
            finishBtn.isEnabled = false
            print("11111")
            return
        }
        print("비밀번호 일치12222")
        finishBtn.isEnabled = true
        UserInformation.shared.phoneNum = pNum
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func popToPrev(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
        
        UserInformation.shared.id = nil
        UserInformation.shared.password = nil
        UserInformation.shared.selfIntroduce = nil
        UserInformation.shared.phoneNum = nil
        UserInformation.shared.birthday = nil
    }
    
    @IBAction func finishBtnClicked(_ sender: Any){
        self.navigationController?.popToRootViewController(animated: true)
        
        UserInformation.shared.id = nil
        UserInformation.shared.password = nil
        UserInformation.shared.selfIntroduce = nil
        UserInformation.shared.phoneNum = nil
        UserInformation.shared.birthday = nil
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

//
//  ViewController.swift
//  ViewTransition
//
//  Created by 박윤배 on 2021/04/16.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    
    @IBAction func touchUpSetButton(_ sender: UIButton){
        UserInformation.shared.name = nameField.text
        UserInformation.shared.age = ageField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


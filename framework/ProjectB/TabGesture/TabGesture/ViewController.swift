//
//  ViewController.swift
//  TabGesture
//
//  Created by 박윤배 on 2021/04/16.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer){
        self.view.endEditing(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapView(_:)))
//        코드를 통해 추가하고 싶다면
//        self.view.addGestureRecognizer(tapGesture)
    }


}


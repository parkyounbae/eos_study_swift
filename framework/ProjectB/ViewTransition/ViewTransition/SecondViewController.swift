//
//  SecondViewController.swift
//  ViewTransition
//
//  Created by 박윤배 on 2021/04/16.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //뷰가 로드되기 직전에 실행됨
        self.nameLabel.text = UserInformation.shared.name
        self.ageLabel.text = UserInformation.shared.age
    }
    
    @IBAction func popToPrev(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dismissModal(){
        self.dismiss(animated: true, completion: nil)    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

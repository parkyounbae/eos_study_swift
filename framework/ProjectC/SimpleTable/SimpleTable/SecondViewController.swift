//
//  SecondViewController.swift
//  SimpleTable
//
//  Created by 박윤배 on 2021/04/21.
//

import UIKit

class SecondViewController: UIViewController {
    
    var textToSet: String?
    
    @IBOutlet weak var textLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.textLabel.text = textToSet
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

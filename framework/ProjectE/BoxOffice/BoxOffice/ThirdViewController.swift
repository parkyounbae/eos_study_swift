//
//  ThirdViewController.swift
//  BoxOffice
//
//  Created by 박윤배 on 2021/05/21.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    @IBOutlet weak var movieTableView: UITableView!
    let movieDetailTableViewCellIdentifier: String = "movieDetailCell"
    let movieSynopsysTableViewCellIdentifier: String = "movieSynopsysCell"
    let moviePeopleTableViewCellIdentifier: String = "moviePeopleCell"
    let movieCommentTableViewCellIdentifier: String = "movieCommentCell"
    
    var id: String = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

//
//  ViewController.swift
//  BoxOffice
//
//  Created by 박윤배 on 2021/05/12.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    var movies: [Movie] = []
    

    //MARK: ViewLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.didReceiveMoviesNotification(_:)), name: DidReceiveMoviesNotification, object: nil)
        
        self.navigationItem.title = "양수리 영화관"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        requestMovies()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    //MARK: Function
    
    @objc func didReceiveMoviesNotification(_ noti: Notification){
        guard let movies: [Movie] = noti.userInfo?["movies"] as? [Movie] else {return}
        
        self.movies = movies
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! MovieTableViewCell
        
        let movie: Movie = movies[indexPath.item]
        
        //cell.movieName.text = movie.title //연령제한 추가해야함
        cell.movieOpen.text = movie.dateString
        cell.movieTicker.text = movie.fullInfo
        cell.moviePoster.image = nil
        
        let attachment = NSTextAttachment()
        
        switch movie.grade {
        case 0:
            attachment.image = UIImage(named: "ic_allages")
        case 12:
            attachment.image = UIImage(named: "ic_12")
        case 15:
            attachment.image = UIImage(named: "ic_15")
        case 19:
            attachment.image = UIImage(named: "ic_19")
        default:
            attachment.image = UIImage(named: "ic_allages")
        }
        
        let attachmentString = NSAttributedString(attachment: attachment)
        let contentString = NSMutableAttributedString(string: movie.title)
        contentString.append(attachmentString)
        cell.movieName.attributedText = contentString
        
        DispatchQueue.global().async {
            guard let imageURL: URL = URL(string: movie.thumb) else { return }
            //이거는 지금 동기메서드임,, 그렇기 때문에 사진을 다운 받는 동안 화면이 멈춰있음;;
            //다운 받는거 까지는 백그라운드에서 하는데 이미지를 세팅해주는건 메인에서 해줘야 한다.
            guard let imageData: Data = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                //셀을 위 아래로 움직이면서 이미지ㅡㄹ 넣어줄 셀의 인덱스가 바뀔수가 있음 .. 그러므로 같을 때만 이미지를 삽입
                if let index: IndexPath = self.tableView.indexPath(for: cell) {
                    if index.row == indexPath.row {
                        cell.imageView?.image = UIImage(data: imageData)
                        
                        //레이아웃이 결정되어있지 않은 상황에서 이댜로 실행하면 사진이 안뜸;; 눌러줘야 뜨는 상황 발생
                        //이미지 브렌치에 플레이스 홀더를 넣어주는게 좋음
                        cell.setNeedsLayout()
                        cell.layoutIfNeeded()
                        
                    }
                }
            }
        }
        return cell
    }
    
    
    

}


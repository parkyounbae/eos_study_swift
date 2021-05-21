//
//  SecondViewController.swift
//  BoxOffice
//
//  Created by 박윤배 on 2021/05/12.
//

import UIKit

class SecondViewController: UIViewController, UICollectionViewDataSource {
   
    
    @IBOutlet weak var collectionView: UICollectionView!
    let cellIdentifier: String = "cell"
    var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(self.didReceiveMoviesNotification(_:)), name: DidReceiveMoviesNotification, object: nil)
        
        let flowLayout: UICollectionViewFlowLayout
        flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) //셀 내의 섹션의 인셋을 0으로
        flowLayout.minimumInteritemSpacing = 10 //아이템간의 거리가 10보다는 크게
        flowLayout.minimumLineSpacing = 10 //줄 간의 거리가 10보다는 크게
        
        let halfWidth: CGFloat = UIScreen.main.bounds.width / 2.0 //화면에 2개씩 배치
        
        flowLayout.itemSize = CGSize(width: halfWidth - 30, height: 300)
        //예상사이즈 지정 -> 오토레이아웃에 따라 셀 사이즈가 변할 수 있기 때문
        
        self.collectionView.collectionViewLayout = flowLayout
        
        self.navigationItem.title = "양수리 영화관"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        requestMovies()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func didReceiveMoviesNotification(_ noti: Notification){
        guard let movies: [Movie] = noti.userInfo?["movies"] as? [Movie] else {return}
        
        self.movies = movies
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as! MovieCollectionViewCell
        
        let movie: Movie = movies[indexPath.item]
        
        cell.movieName.text = movie.title //연령제한 추가해야함
        cell.movieOpen.text = movie.dateString
        cell.movieTicker.text = movie.fullInfo
        cell.moviePoster.image = nil
        
        switch movie.grade {
        case 0:
            cell.movieGrade.image = UIImage(named: "ic_allages")
        case 12:
            cell.movieGrade.image = UIImage(named: "ic_12")
        case 15:
            cell.movieGrade.image = UIImage(named: "ic_15")
        case 19:
            cell.movieGrade.image = UIImage(named: "ic_19")
        default:
            cell.movieGrade.image = UIImage(named: "ic_allages")
        }
        
        DispatchQueue.global().async {
            guard let imageURL: URL = URL(string: movie.thumb) else { return }
            //이거는 지금 동기메서드임,, 그렇기 때문에 사진을 다운 받는 동안 화면이 멈춰있음;;
            //다운 받는거 까지는 백그라운드에서 하는데 이미지를 세팅해주는건 메인에서 해줘야 한다.
            guard let imageData: Data = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                //셀을 위 아래로 움직이면서 이미지ㅡㄹ 넣어줄 셀의 인덱스가 바뀔수가 있음 .. 그러므로 같을 때만 이미지를 삽입
                if let index: IndexPath = self.collectionView.indexPath(for: cell) {
                    if index.row == indexPath.row {
                        cell.moviePoster?.image = UIImage(data: imageData)
                        
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
    
    
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextView: ThirdViewController = segue.destination as? ThirdViewController else {
            return
        }
        
        guard let cell: MovieCollectionViewCell = sender as? MovieCollectionViewCell else {
            return
        }
        
        guard let index: IndexPath = self.collectionView.indexPath(for: cell) else {
            return
        }
        
        nextView.id = movies[index.item].id
    }
    

}

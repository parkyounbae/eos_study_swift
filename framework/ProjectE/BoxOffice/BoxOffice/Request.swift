//
//  Request.swift
//  BoxOffice
//
//  Created by 박윤배 on 2021/05/12.
//

import Foundation

let DidReceiveMoviesNotification: Notification.Name = Notification.Name("DidReceiveMovies")

func requestMovies(){
    guard let url: URL = URL(string: "https://connect-boxoffice.run.goorm.io/movies?order_type=1") else {return} //주소 추가하기
    
    let session: URLSession = URLSession(configuration: .default)
    let dataTesk: URLSessionDataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        guard let data = data else {return}
        
        do{
            let apiResponse: APIResponse = try JSONDecoder().decode(APIResponse.self, from: data)
            //let apiResponse: APIResponse = try JSONDecoder().decode(APIResponse.self, from: data)
            
            NotificationCenter.default.post(name: DidReceiveMoviesNotification, object: nil, userInfo: ["movies":apiResponse.movies])
        } catch(let err) {
            print(err.localizedDescription)
        }
    }
    
    dataTesk.resume()
}

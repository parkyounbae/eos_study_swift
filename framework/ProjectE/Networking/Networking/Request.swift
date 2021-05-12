//
//  Request.swift
//  Networking
//
//  Created by 박윤배 on 2021/05/11.
//

import Foundation




func requestFriends() {
    guard let url: URL = URL(string : "https://randomuser.me/api/?results=20&inc=name,email,picture") else {
        return
    }
    
    let session: URLSession = URLSession(configuration: .default)
    let dataTesk: URLSessionDataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        guard let data = data else {return}
        
        do{
            let apiResponse: APIResponse = try JSONDecoder().decode(APIResponse.self, from: data)
            
            
            NotificationCenter.default.post(name: DidReceiveFriendsNotification, object: nil, userInfo:  ["friends":apiResponse.results])
            //메인과 소통하기 위해 결과값을 실어서 노티를 보냄
            
            
//            self.friends = apiResponse.results
//            이 코드들은 지금 따로 파일을 만들어서 떼왔기 때문에
            // 지금 메인에 있는걸 어찌 할 수 가 없음
//            DispatchQueue.main.async {
//                //이건 백그라운드에서 실행하면 안된다. .. 고로 메인 쓰레드로 가져오기
//                self.tableView.reloadData()
//            }
//
        } catch(let err){
            print(err.localizedDescription)
        }
    }
    
    dataTesk.resume()
}

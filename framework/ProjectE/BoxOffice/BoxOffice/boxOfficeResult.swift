//
//  boxOfficeResult.swift
//  BoxOffice
//
//  Created by 박윤배 on 2021/05/12.
//

import Foundation

struct APIResponse: Codable{
    let results: [Movie]
}

struct Movie: Codable{
    //영화이름, 영화 포스터, 평점, 예매 순위, 예매율, 개봉일
    let grade: Int //   순위
    let thumb: String //포스터 링크
    let reservation_grade: Int //예매 순위
    let title: String //제목
    let reservation_rate: Double //예매율
    let user_rating: Double //관람객 평점
    let date: String //개봉일
    let id: String //영화 고유 아이디
    
    var fullInfo: String{
        //평점: 7.2, 예매 순위: 2, 예매율: 32
        return "평점: \(user_rating), 예매 순위: \(reservation_grade), 예매율: \(reservation_rate)"
    }
    
    var dateString: String{
        return "개봉일 : \(date)"
    }
}

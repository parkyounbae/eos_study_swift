//
//  movieDetail.swift
//  BoxOffice
//
//  Created by 박윤배 on 2021/05/21.
//

import Foundation



struct Detail: Codable {
    let audience: Int
    let actor: String
    let duration: Int
    let director: String
    let synopsis: String
    let genre: String
    let grade: Int
    let image: String
    let reservation_grade: Int
    let title: String
    let reservation_rate: Double
    let user_rating: Double
    let data: String
    let id: String
}

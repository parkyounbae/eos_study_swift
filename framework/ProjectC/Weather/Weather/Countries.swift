//
//  Contries.swift
//  Weather
//
//  Created by 박윤배 on 2021/04/22.
//

import Foundation

struct Countries: Codable {
    let koreanName: String
    let assetName: String
    
    enum CodingKeys: String, CodingKey {
        case koreanName = "korean_name"
        case assetName = "asset_name"
    }
}

//
//  WeatherInformation.swift
//  Weather
//
//  Created by 박윤배 on 2021/04/22.
//

import Foundation

struct WeatherInformation: Codable{
    
    let cityName: String
    let state: Int
    let celsius: Float
    let rainfallProbability: Int
    
    var CNF: String {
        return "섭씨 \(celsius)도 / 화씨 \(celsius*0.18+32)도"
    }
    
    var persentPersent: String{
        return "강수확률 \(rainfallProbability)%"
    }
    
    enum CodingKeys: String, CodingKey {
        case state, celsius
        case cityName = "city_name"
        case rainfallProbability = "rainfall_probability"
    }
}

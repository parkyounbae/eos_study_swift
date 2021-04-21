//
//  Friend.swift
//  MyFriends
//
//  Created by 박윤배 on 2021/04/21.
//

import Foundation

/*
 "name" = "hana"
 "age" = 23
 "address_info: {
 "country" = "korea"
 "city" = "yangsu"
 }
 }
 
 */

//제이슨 파일에서 정보를 꺼내고 넣으려면 codable해야함
struct Friend: Codable {
    struct Address: Codable {
        let country: String
        let city: String
    }
    
    let name: String
    let age: Int
    let addressInfo: Address
    
    var nameAndAge: String {
        return self.name + "(\(self.age))"
    }
    
    var fullAddress: String {
        return self.addressInfo.country + ", " + self.addressInfo.city
    }
    
    
    //우리가 만약 addressInfo로 이름을 바꾸고 싶다면..
    //그냥 바꾸면 joson이랑 프로퍼티랑 이름이 달라서 오류남;;
    enum CodingKeys: String, CodingKey{
        case name, age
        case addressInfo = "address_info" //이렇게 하면 매칭 가능
    }
}

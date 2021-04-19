//
//  UserInformation.swift
//  SignUp
//
//  Created by 박윤배 on 2021/04/19.
//

import Foundation

class UserInformation {
    static let shared: UserInformation = UserInformation()
    
    var id: String?
    var password: String?
    var selfIntroduce: String?
    var phoneNum: String?
    var birthday: String?
}

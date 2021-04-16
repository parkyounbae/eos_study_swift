//
//  UserInformation.swift
//  ViewTransition
//
//  Created by 박윤배 on 2021/04/16.
//

import Foundation

class UserInformation{
    static let shared: UserInformation = UserInformation()
    //우리가 타입프로퍼티로 인스턴스를 하나 생성해 할당해 주었기 때문에 타입 프로퍼티를 호출하면 항상 같은 인스턴스가 등장할 것이다.
    //싱글톤을 사용할 때 주의할 점은 흔히 사용되는 이름을 사용하면 나중에 해팅으로부터 공격을 당할 수 있다.
    
    
    var name: String?
    var age: String?
    //텍스트 필드는 사용자가 숫자로 입력해도 문자열로 받아온다. 
}

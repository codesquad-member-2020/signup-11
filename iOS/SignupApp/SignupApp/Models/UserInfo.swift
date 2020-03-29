//
//  User.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/29.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

struct UserInfo: Codable {
    let userId: String
    let password: String
    let name: String
    let birth = "2020-03-24"
    let gender = "male"
    let email = "test@gmail.com"
    let phone = "01012345678"
    let interests = "영화감상, 자전거"
}

//
//  UserCreationRequest.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/10/20.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

struct UserCreationRequest: Request {
    private let data: Data
    
    init(data: Data) {
        self.data = data
    }
    
    var path: String {
        return Endpoints.urlStringUserIntitatationInfo
    }
    
    var method: HTTPMethod {
        return .post
    }
    
    var body: Data? {
        return data
    }
}

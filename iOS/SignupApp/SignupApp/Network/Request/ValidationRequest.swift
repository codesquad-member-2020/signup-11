//
//  ValidationRequest.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/10/20.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

struct ValidationRequest: Request {
    private let id: String
    
    var path: String {
        "\(Endpoints.urlStringUserIDInfo)\(id)"
    }
    
    init(id: String) {
        self.id = id
    }
}

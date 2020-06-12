//
//  IDResponse.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/06/12.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

struct IDResponse: Codable {
    let isOverlapped: Bool
    
    private enum CodingKeys: String, CodingKey {
        case isOverlapped = "success"
    }
}

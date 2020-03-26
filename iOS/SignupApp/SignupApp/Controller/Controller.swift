//
//  Controller.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/26.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class Controller {
    
    private static let correctIDPattern = "^[a-z0-9_\\-]{5,20}$"
    
    static func isTextLengthZero(count: Int?) -> Bool {
        guard let count = count else { return false }
        return count == 0
    }

    static func isCorrectID(_ text: String?) -> Bool {
        guard let text = text, text.range(of: correctIDPattern,
                                          options: .regularExpression) != nil
        else { return false }
        return true
    }
}

//
//  Controller.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/26.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class Controller {
    static func isTextLengthZero(count: Int?) -> Bool {
        guard let count = count else { return false }
        return count == 0
    }
}

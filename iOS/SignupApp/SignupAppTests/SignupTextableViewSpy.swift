//
//  SignupTextableViewSpy.swift
//  SignupAppTests
//
//  Created by kimdo2297 on 2020/07/02.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit
@testable import SignupApp

final class SignupTextableViewSpy: UIView, SignupTextableView {
    var isCorrect: Bool = false
    var text: String? = nil
    var message: String? = nil
    
    func setWrongCase(message: String) {
        self.message = message
    }
    
    func setCorrectCase(message: String) {
        self.message = message
    }
}

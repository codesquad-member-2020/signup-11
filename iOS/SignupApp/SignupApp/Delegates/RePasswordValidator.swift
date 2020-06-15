//
//  PWAgainTextField.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class RePasswordValidator: SignupValidator {
    private func isSameText(lhs: String?, rhs: String?) -> Bool {
        guard let lhs = lhs, let rhs = rhs else { return false }
        return lhs == rhs
    }
    
    private static let messagePrePasswordFirst = "이전 비밀번호를 먼저 올바르게 입력해주시기 바랍니다."
    private static let messageNotSamePassword = "비밀번호가 일치하지 않습니다."
    private static let messageSamePassword = "비밀번호가 일치합니다."
    
    override func validateText(of signupTextableView: SignupTextableView?) {
        guard let signupTextableView = signupTextableView else { return }
        guard let rePasswordableView = signupTextableView as? RePasswordableView else { return }
        
        if !isSameText(lhs: rePasswordableView.passwordTextableView?.text, rhs: rePasswordableView.text) {
            rePasswordableView.setWrongCase(message: Self.messageNotSamePassword)
        } else {
            rePasswordableView.setCorrectCase(message: Self.messageSamePassword)
        }
        
        super.validateText(of: rePasswordableView)
    }
}

//if !pwAgainTextField.passwordTextableView.isCorrect{
//         pwAgainTextField.setWrongCase(message: Self.messagePrePasswordFirst)
//}

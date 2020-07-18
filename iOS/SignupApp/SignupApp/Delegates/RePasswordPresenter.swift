//
//  PWAgainTextField.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class RePasswordPresenter: SignupPresenter {
    private enum Message {
        static let prePasswordInputRequest = "이전 비밀번호를 먼저 올바르게 입력해주시기 바랍니다."
        static let notSame = "비밀번호가 일치하지 않습니다."
        static let samePassword = "비밀번호가 일치합니다."
    }
    
    override func validateText(of signupTextableView: SignupTextableView?) -> Bool {
        guard super.validateText(of: signupTextableView) else { return false }
        guard let signupTextableView = signupTextableView else { return false }
        guard let rePasswordableView = signupTextableView as? RePasswordableView,
            let passwordTextableView = rePasswordableView.passwordTextableView else { return false }
        
        guard passwordTextableView.isCorrect else {
            rePasswordableView.setWrongCase(message: Message.prePasswordInputRequest)
            return false
        }
        
        guard isSameText(lhs: passwordTextableView.text, rhs: rePasswordableView.text) else {
            rePasswordableView.setWrongCase(message: Message.notSame)
            return false
        }
        
        rePasswordableView.setCorrectCase(message: Message.samePassword)
        return true
    }
    
    private func isSameText(lhs: String?, rhs: String?) -> Bool {
        guard let lhs = lhs, let rhs = rhs else { return false }
        return lhs == rhs
    }
}

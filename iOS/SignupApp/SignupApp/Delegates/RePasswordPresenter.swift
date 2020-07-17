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
    
    override func validateText(of signupTextableView: SignupTextableView?) {
        guard let signupTextableView = signupTextableView else { return }
        guard let rePasswordableView = signupTextableView as? RePasswordableView,
            let passwordTextableView = rePasswordableView.passwordTextableView else { return }
        
        if !passwordTextableView.isCorrect {
            rePasswordableView.setWrongCase(message: Message.prePasswordInputRequest)
        } else if !isSameText(lhs: passwordTextableView.text, rhs: rePasswordableView.text) {
            rePasswordableView.setWrongCase(message: Message.notSame)
        } else {
            rePasswordableView.setCorrectCase(message: Message.samePassword)
        }
        
        super.validateText(of: rePasswordableView)
    }
    
    private func isSameText(lhs: String?, rhs: String?) -> Bool {
        guard let lhs = lhs, let rhs = rhs else { return false }
        return lhs == rhs
    }
}

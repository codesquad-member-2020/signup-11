//
//  IDTextFieldDelegate.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class IDPresenter: SignupPresenter {
    private enum Message {
        static let notCorrectID = "5~20자의 영문 소문자, 숫자와 특수기호(_)(-)만 사용 가능합니다."
        static let validationRequest = "사용 가능하지만 아이디 중복 검사를 진행하셔야 합니다."
    }
    
    override func validateText(of signupTextableView: SignupTextableView?) -> Bool {
        guard super.validateText(of: signupTextableView) else { return false }
        guard let signupTextableView = signupTextableView,
        let idTextableView = signupTextableView as? IDableView,
            idTextableView.status != .isCorrect else { return false }
        
        guard isCorrectID(idTextableView.text) else {
            idTextableView.setWrongCase(message: Message.notCorrectID)
            idTextableView.status = .isNotCorrect
            return false
        }
        
        idTextableView.setWrongCase(message: Message.validationRequest)
        idTextableView.status = .isCorrectButNotCheckOverlapValidation
        return false
    }
    
    private static let correctIDPattern = "^[a-z0-9_\\-]{5,20}$"
    
    private func isCorrectID(_ text: String?) -> Bool {
        guard let text = text else { return false }
        
        return text.range(of: Self.correctIDPattern, options: .regularExpression) != nil
    }
}

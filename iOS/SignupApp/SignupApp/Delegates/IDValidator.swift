//
//  IDTextFieldDelegate.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class IDValidator: SignupValidator {
    private static let correctIDPattern = "^[a-z0-9_\\-]{5,20}$"
    private func isCorrectID(_ text: String?) -> Bool {
        guard let text = text else { return false }
        
        return text.range(of: Self.correctIDPattern, options: .regularExpression) != nil
    }
    
    private static let messageNotCorrectID = "5~20자의 영문 소문자, 숫자와 특수기호(_)(-)만 사용 가능합니다."
    private static let messageRequireValidation = "사용 가능하지만 아이디 중복 검사를 진행하셔야 합니다."
    
    override func validateText(of signupTextableView: SignupTextableView?) {
        guard let signupTextableView = signupTextableView else { return }
        
        guard let idField = signupTextableView as? IDField,
        idField.status != .isCorrect else { return }
        
        if isCorrectID(idField.text) {
            idField.setWrongCase(message: Self.messageRequireValidation)
            idField.status = .isCorrectButNotCheckOverlapValidation
        } else {
            idField.setWrongCase(message: Self.messageNotCorrectID)
            idField.status = .isNotCorrect
        }
        
        super.validateText(of: idField)
    }
}

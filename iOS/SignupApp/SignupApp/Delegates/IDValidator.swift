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
}

extension IDValidator {
    private static let messageNotCorrectID = "5~20자의 영문 소문자, 숫자와 특수기호(_)(-)만 사용 가능합니다."
    private static let messageRequireValidation = "사용 가능하지만 아이디 중복 검사를 진행하셔야 합니다."
    
    override func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let idField = textField as? IDField,
        idField.status != .isCorrect else { return }
        
        if isCorrectID(idField.text) {
            idField.setWrongCase(message: Self.messageRequireValidation)
            idField.status = .isCorrectButNotCheckOverlapValidation
        } else {
            idField.setWrongCase(message: Self.messageNotCorrectID)
            idField.status = .isNotCorrect
        }
        super.textFieldDidChangeSelection(textField)
    }
    
    override func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        guard let idField = textField as? IDField,
        idField.status != .isCorrect else { return false }
        
        if isCorrectID(idField.text) {
            idField.setWrongCase(message: Self.messageRequireValidation)
            idField.status = .isCorrectButNotCheckOverlapValidation
        } else {
            idField.setWrongCase(message: Self.messageNotCorrectID)
            idField.status = .isNotCorrect
        }
        return super.textFieldShouldEndEditing(textField)
    }
}

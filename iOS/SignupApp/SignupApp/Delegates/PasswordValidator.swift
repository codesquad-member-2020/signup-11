//
//  PWTextFieldDelegate.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class PasswordValidator: SignupValidator {
    override var textLimit: Int {
        return 16
    }
    
    override func textFieldDidChangeSelection(_ textField: UITextField) {
        validateCurrentText(of: textField)
    }
    
    override func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        validateCurrentText(of: textField)
        return true
    }
    
    private static let messageCorrectTextLength = "8자 이상 16자 이하로 입력해주세요."
    private static let messageWriteUpperCapitalLetter = "영문 대문자를 최소 1자 이상 포함해주세요. "
    private static let messageWriteNumber = "숫자를 최소 1자 이상 포함해주세요."
    private static let messageWriteSpecialCharacter = "특수문자를 최소 1자 이상 포함해주세요.(!@#$%)"
    private static let messageCorrectPassword = "안전한 비밀번호입니다."
    override func validateCurrentText(of textField: UITextField) {
        super.validateCurrentText(of: textField)
        guard let pwTextField = textField as? SignupField,
            !pwTextField.isEqual(message: SignupValidator.messageRequireText) else { return }
        
        guard isCorrectLength(min: 8, max: 16, count: pwTextField.text?.count)
            else { pwTextField.setWrongCase(message: Self.messageCorrectTextLength); return }
        guard hasUpperCaseLetter(pwTextField.text)
            else { pwTextField.setWrongCase(message: Self.messageWriteUpperCapitalLetter); return }
        guard hasNumber(pwTextField.text)
            else { pwTextField.setWrongCase(message: Self.messageWriteNumber); return }
        guard hasSpecialCharacter(pwTextField.text)
            else { pwTextField.setWrongCase(message: Self.messageWriteSpecialCharacter); return }
        
        pwTextField.setCorrectCase(message: Self.messageCorrectPassword)
    }
    
    private func isCorrectLength(min: Int = 1, max: Int, count: Int?) -> Bool {
        guard let count = count else { return false }
        
        return count >= min && count <= max
    }
    
    private static let hasUpperCaseLetterPattern = "[A-Z]"
    private func hasUpperCaseLetter(_ text: String?) -> Bool {
        guard let text = text else { return false }
        
        let range = NSRange(location: 0, length: text.count)
        let regex = try! NSRegularExpression(pattern: Self.hasUpperCaseLetterPattern)
        return regex.firstMatch(in: text, range: range) != nil
    }
    
    private static let hasNumberPattern = "[0-9]"
    private func hasNumber(_ text: String?) -> Bool {
        guard let text = text else { return false }
        
        let range = NSRange(location: 0, length: text.count)
        let regex = try! NSRegularExpression(pattern: Self.hasNumberPattern)
        return regex.firstMatch(in: text, range: range) != nil
    }
    
    private static let hasSpecialCharacterPattern = "[!@#$%]"
    private func hasSpecialCharacter(_ text: String?) -> Bool {
        guard let text = text else { return false }
        
        let range = NSRange(location: 0, length: text.count)
        let regex = try! NSRegularExpression(pattern: Self.hasSpecialCharacterPattern)
        return regex.firstMatch(in: text, range: range) != nil
    }
}

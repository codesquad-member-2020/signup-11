//
//  PWTextFieldDelegate.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class PasswordPresenter: SignupPresenter {
    override var textLimit: Int {
        return 16
    }
    
    private enum Message {
        static let correctTextLengthRequest = "8자 이상 16자 이하로 입력해주세요."
        static let upperCapitalLetterRequest = "영문 대문자를 최소 1자 이상 포함해주세요."
        static let numberRequest = "숫자를 최소 1자 이상 포함해주세요."
        static let specialCharacterRequest = "특수문자를 최소 1자 이상 포함해주세요.(!@#$%)"
        static let correctPassword = "안전한 비밀번호입니다."
    }
    
    @discardableResult
    override func validateText(of signupTextableView: SignupTextableView?) -> Bool {
        guard super.validateText(of: signupTextableView) else { return false }
        
        guard let signupTextableView = signupTextableView else { return false }
        
        guard isCorrectLength(min: 8, max: 16, count: signupTextableView.text?.count) else {
            signupTextableView.setWrongCase(message: Message.correctTextLengthRequest)
            return false
        }
        
        guard hasUpperCaseLetter(signupTextableView.text) else {
            signupTextableView.setWrongCase(message: Message.upperCapitalLetterRequest)
            return false
        }
        
        guard hasNumber(signupTextableView.text) else {
            signupTextableView.setWrongCase(message: Message.numberRequest)
            return false
        }
        
        guard hasSpecialCharacter(signupTextableView.text) else {
            signupTextableView.setWrongCase(message: Message.specialCharacterRequest)
            return false
        }
        
        signupTextableView.setCorrectCase(message: Message.correctPassword)
        return true
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


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
    
    override func validateText(of signupTextableView: SignupTextableView?) {
        guard let signupTextableView = signupTextableView else { return }
        
        if !isCorrectLength(min: 8, max: 16, count: signupTextableView.text?.count) {
            signupTextableView.setWrongCase(message: Message.correctTextLengthRequest)
        } else if !hasUpperCaseLetter(signupTextableView.text) {
            signupTextableView.setWrongCase(message: Message.upperCapitalLetterRequest)
        } else if !hasNumber(signupTextableView.text) {
            signupTextableView.setWrongCase(message: Message.numberRequest)
        } else if !hasSpecialCharacter(signupTextableView.text) {
            signupTextableView.setWrongCase(message: Message.specialCharacterRequest)
        } else {
            signupTextableView.setCorrectCase(message: Message.correctPassword)
        }
        
        super.validateText(of: signupTextableView)
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


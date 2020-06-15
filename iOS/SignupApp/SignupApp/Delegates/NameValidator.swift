//
//  NameTextFieldDelegate.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class NameValidator: SignupValidator {
    private static let messageShouldNotHaveSpace = "공백이 포함되면 안됩니다."
    private static let messageCorrectName = "사용가능한 이름입니다."
    
    override func validateText(of signupTextableView: SignupTextableView?) {
        guard let signupTextableView = signupTextableView else { return }
        
        if !hasNoSpace(signupTextableView.text) {
            signupTextableView.setWrongCase(message: Self.messageShouldNotHaveSpace)
        } else {
            signupTextableView.setCorrectCase(message: Self.messageCorrectName)
        }
        
        super.validateText(of: signupTextableView)
    }
    
    private static let spaceCharacterPattern = "[\\s]"
    private func hasNoSpace(_ text: String?) -> Bool {
        guard let text = text else { return false }
        
        let range = NSRange(location: 0, length: text.count)
        let regex = try! NSRegularExpression(pattern: Self.spaceCharacterPattern)
        return regex.firstMatch(in: text, range: range) == nil
    }
}

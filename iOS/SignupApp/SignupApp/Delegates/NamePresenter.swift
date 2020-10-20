//
//  NameTextFieldDelegate.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class NamePresenter: SignupPresenter {
    private enum Message {
        static let noSpaceRequest = "공백이 포함되면 안됩니다."
        static let correctName = "사용가능한 이름입니다."
    }
    
    @discardableResult
    override func validateText(of signupTextableView: SignupTextableView?) -> Bool {
        guard super.validateText(of: signupTextableView) else { return false }
        
        guard let signupTextableView = signupTextableView else { return false }
        
        guard hasNoSpace(signupTextableView.text) else {
            signupTextableView.setWrongCase(message: Message.noSpaceRequest)
            return false
        }
        
        signupTextableView.setCorrectCase(message: Message.correctName)
        return true
    }
    
    private static let spaceCharacterPattern = "[\\s]"
    private func hasNoSpace(_ text: String?) -> Bool {
        guard let text = text else { return false }
        
        let range = NSRange(location: 0, length: text.count)
        let regex = try! NSRegularExpression(pattern: Self.spaceCharacterPattern)
        return regex.firstMatch(in: text, range: range) == nil
    }
}

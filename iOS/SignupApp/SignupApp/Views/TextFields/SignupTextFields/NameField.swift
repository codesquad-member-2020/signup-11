//
//  NameTextField.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class NameField: SignupField {
    override func setCorrectCase() {
        super.setCorrectCase()
        setMessageCorrectName()
    }
    
    private func setMessageCorrectName() {
        let messageCorrectName = "사용가능한 이름입니다."
        setCorrectMessage(text: messageCorrectName)
    }
    
    func setWrongCaseByHasSpace() {
        super.setWrongCase()
        setMessageShouldNotHaveSpace()
    }
    
    private func setMessageShouldNotHaveSpace() {
        let messageShouldNotHaveSpace = "공백이 포함되면 안됩니다."
        setWrongMessage(text: messageShouldNotHaveSpace)
    }
}
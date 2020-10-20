//
//  CustomTextFieldDelegate.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class SignupPresenter: NSObject {
    var textLimit : Int {
        return 20
    }
    
    private enum Message {
        static let textInputRequest = "필수 항목입니다."
    }
    
    weak var signupTextableView: SignupTextableView?
    
    init(signupTextableView: SignupTextableView) {
        self.signupTextableView = signupTextableView
    }
    
    @discardableResult
    func validateText() -> Bool {
        guard let signupTextableView = signupTextableView else { return false }
        guard isNotZero(count: signupTextableView.text?.count) else {
            signupTextableView.setWrongCase(message: Message.textInputRequest)
            return false
        }
        
        return true
    }
    
    private func isNotZero(count: Int?) -> Bool {
        guard let count = count else { return false }
        return count != 0
    }
}

extension SignupPresenter: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        
        let textFieldTextCount = textField.text?.count ?? 0
        let totalLength = textFieldTextCount + string.count - range.length
        
        return totalLength <= textLimit
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let signupTextField = textField as? FormField {
            signupTextField.nextResonder?.becomeFirstResponder()
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        validateText()
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        validateText()
        return true
    }
}

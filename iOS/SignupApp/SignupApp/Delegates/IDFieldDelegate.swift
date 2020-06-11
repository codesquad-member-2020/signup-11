//
//  IDTextFieldDelegate.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class IDFieldDelegate: SignupFieldDelegate {
    override func textFieldDidChangeSelection(_ textField: UITextField) {
        validateCurrentText(of: textField)
    }
    
    override func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        validateCurrentText(of: textField)
        return true
    }
    
    private static let messageNotCorrectID = "5~20자의 영문 소문자, 숫자와 특수기호(_)(-)만 사용 가능합니다."
    private static let messageIsValidatingOverlapped = "사용가능한 아이디이지만, 현재 아이디 중복 검사 중입니다."
    private static let messageOverlappedID = "이미 사용중인 아이디입니다."
    private static let messageCorrectID = "사용 가능한 아이디입니다."
    override func validateCurrentText(of textField: UITextField) {
        guard let signupField = textField as? SignupField else { return }
        guard isCorrectID(signupField.text)
            else { signupField.setWrongCase(message: Self.messageNotCorrectID); return }
        signupField.setWrongCase(message: Self.messageIsValidatingOverlapped)
        
        validateOverlappedID(signupField.text) { isOverlapped in
            guard let isOverlapped = isOverlapped else { return }
            self.setCaseBy(isOverlapped, signupField: signupField)
        }
        super.validateCurrentText(of: textField)
    }
    
    private static let correctIDPattern = "^[a-z0-9_\\-]{5,20}$"
    private func isCorrectID(_ text: String?) -> Bool {
        guard let text = text else { return false }
        
        return text.range(of: Self.correctIDPattern, options: .regularExpression) != nil
    }
    
    private func validateOverlappedID(_ id: String?, resultHandler: @escaping (Bool?) -> ()) {
        guard let id = id else { return }
        NetworkManager.excuteURLSession(
            method: .get,
            from: "\(SignupURL.urlStringUserIDInfo)\(id)", data: nil) { data in
                guard let data = data else { return }
                guard let idResponse = DataCoder.decodeJSONData(
                    type: Response.self,
                    data: data,
                    dateDecodingStrategy: nil
                    ) else { return }
                resultHandler(idResponse.success)
        }
    }
    
    private func setCaseBy(_ isOverlapped: Bool, signupField: SignupField) {
        DispatchQueue.main.async {
            if isOverlapped {
                signupField.setWrongCase(message: Self.messageOverlappedID)
                return
            }
            signupField.setCorrectCase(message: Self.messageCorrectID)
        }
    }
}

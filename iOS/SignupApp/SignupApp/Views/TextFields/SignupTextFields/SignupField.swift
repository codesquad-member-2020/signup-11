//
//  CustomTextField.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

protocol SignupFieldDelegate: class {
    func signupFieldIsCorrectDidChange()
}

class SignupField: FormField {
    static let notificationIsCorrectDidChange = Notification.Name("isCorrectDidChange")
    private(set) var isCorrect = false {
        didSet {
            guard isCorrect != oldValue else { return }
            signupFieldDelegate?.signupFieldIsCorrectDidChange()
        }
    }
    private let messageLabel = MessageLabel()
    weak var signupFieldDelegate: SignupFieldDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setMessageLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setMessageLabel()
    }
    
    private func setMessageLabel() {
        addSubview(messageLabel)
        messageLabel.trailingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        messageLabel.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 2).isActive = true
    }
    
    func setWrongCase(message: String) {
        setWrongMessage(text: message)
        setBorderColorRed()
        setCorrectFalse()
    }
    
    func setCorrectCase(message: String) {
        setCorrectMessage(text: message)
        setBorderColorGrey()
        setCorrectTrue()
    }
    
    private func setCorrectTrue() {
        isCorrect = true
    }
    
    private func setCorrectFalse() {
        isCorrect = false
    }
    
    private func setBorderColorGrey() {
        layer.borderColor = UIColor.greyColor.cgColor
    }
    
    private func setBorderColorRed() {
        layer.borderColor = UIColor.redColor.cgColor
    }
    
    // MARK:- Methods related to MessageLabel
    private func setCorrectMessage(text: String) {
        messageLabel.text = text
        messageLabel.textColor = UIColor.greenColor
        messageLabel.isHidden = false
    }
    
    private func setWrongMessage(text: String) {
        messageLabel.text = text
        messageLabel.textColor = UIColor.redColor
        messageLabel.isHidden = false
    }
}

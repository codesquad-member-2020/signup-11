//
//  CustomTextField.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init?(red: Int, green: Int, blue: Int) {
        guard red >= 0 && red <= 255,
            green >= 0 && green <= 255,
            blue >= 0 && blue <= 255
            else { return nil }
        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0,
                  alpha: 1.0)
    }
    
    convenience init?(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

class CustomTextField: UITextField {
    private let messageLabel = MessageLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        setBorder()
        setMessageLabel()
    }
    
    private func setBorder() {
        layer.borderWidth = 0.9
        let greyColor = UIColor(rgb: 0x707070)!
        layer.borderColor = greyColor.cgColor
    }
    
    private func setMessageLabel() {
        addSubview(messageLabel)
        messageLabel.trailingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        messageLabel.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 2).isActive = true
    }
    
}

extension CustomTextField {
    private static let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: CustomTextField.padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: CustomTextField.padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: CustomTextField.padding)
    }
}

extension CustomTextField {
    func setMessageRequireText() {
        let messageRequireText = "필수 항목입니다."
        messageLabel.text = messageRequireText
        messageLabel.textColor = .red
        messageLabel.isHidden = false
    }
}

//
//  NextButton.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/27.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

protocol NextButtonDelegate {
    func nextButtonBecomeFirstResponder()
}

final class NextButton: UIButton {
    var delegate: NextButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        disabled()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        disabled()
    }

    override func becomeFirstResponder() -> Bool {
        delegate?.nextButtonBecomeFirstResponder()
        return true
    }
    
    func enabled() {
        setGreenButton()
        isEnabled = true
    }
    
    private func setGreenButton() {
        setTitleColor(UIColor.greenColor, for: .normal)
        tintColor = UIColor.greenColor
    }
    
    func disabled() {
        setGreyButton()
        isEnabled = false
    }
    
    private func setGreyButton() {
        setTitleColor(UIColor.greyColor, for: .disabled)
        tintColor = UIColor.greyColor
    }
    
}

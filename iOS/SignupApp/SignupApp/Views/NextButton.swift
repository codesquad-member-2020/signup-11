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
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func becomeFirstResponder() -> Bool {
        delegate?.nextButtonBecomeFirstResponder()
        return true
    }
}

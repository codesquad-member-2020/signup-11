//
//  IDField.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/06/12.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class IDField: SignupField, IDableView {
    var status = Status.isNotCorrect

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setWrongCaseOverlappedID() {
        super.setWrongCase(message: "이미 사용중인 아이디입니다.")
    }

    override func setCorrectCase(message: String = "사용 가능한 아이디입니다.") {
        super.setCorrectCase(message: message)
    }
}

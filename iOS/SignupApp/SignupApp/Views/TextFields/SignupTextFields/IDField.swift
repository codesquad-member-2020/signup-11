//
//  IDField.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/06/12.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class IDField: SignupField {
    enum Status {
        case isNotCorrect
        case isCorrectButNotCheckOverlapValidation
        case isCorrect
    }
    var status = Status.isNotCorrect

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

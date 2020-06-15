//
//  IDTextableView.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/06/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

enum Status {
    case isNotCorrect
    case isCorrectButNotCheckOverlapValidation
    case isCorrect
}

protocol IDTextableView: SignupTextableView {
    var status: Status {get set}
}

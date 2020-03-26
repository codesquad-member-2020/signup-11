//
//  Tag.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/26.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class Tag {
    static func nextTagBecomeFirstResponder(view: UIView) {
        let mod = 4
        let nextTag = view.tag % mod + 1
        print(nextTag)
        guard let nextResponder = view.superview?.viewWithTag(nextTag) else { return }
        nextResponder.becomeFirstResponder()
    }
}

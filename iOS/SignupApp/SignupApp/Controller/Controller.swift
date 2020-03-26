//
//  Controller.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/26.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class Controller {
    static func isTextLengthZero(count: Int?) -> Bool {
        guard let count = count else { return false }
        return count == 0
    }
    
    static func isTextCorrectLength(min: Int = 1, max: Int, count: Int?) -> Bool {
        guard let count = count else { return false }
        return min <= count && count <= max
    }

    private static let correctIDPattern = "^[a-z0-9_\\-]{5,20}$"
    static func isCorrectID(_ text: String?) -> Bool {
        guard let text = text, text.range(of: correctIDPattern,
                                          options: .regularExpression) != nil
        else { return false }
        return true
    }
    
    private static let hasUpperCaseLetterPattern = "[A-Z]"
    static func hasUpperCaseLetter(_ text: String?) -> Bool {
        guard let text = text else { return false }
        let range = NSRange(location: 0, length: text.count)
        let regex = try! NSRegularExpression(pattern: hasUpperCaseLetterPattern)
        guard regex.firstMatch(in: text, range: range) != nil
            else { return false }
        return true
    }
    
    private static let hasNumberPattern = "[0-9]"
    static func hasNumber(_ text: String?) -> Bool {
        guard let text = text else { return false }
        let range = NSRange(location: 0, length: text.count)
        let regex = try! NSRegularExpression(pattern: hasNumberPattern)
        guard regex.firstMatch(in: text, range: range) != nil
            else { return false }
        return true
    }
    
    private static let hasSpecialCharacterPattern = "[!@#$%]"
    static func hasSpecialCharacter(_ text: String?) -> Bool {
        guard let text = text else { return false }
        let range = NSRange(location: 0, length: text.count)
        let regex = try! NSRegularExpression(pattern: hasSpecialCharacterPattern)
        guard regex.firstMatch(in: text, range: range) != nil
            else { return false }
        return true
    }
    
    static func isSameText(lhs: String?, rhs: String?) -> Bool {
        guard let lhs = lhs, let rhs = rhs
        else {
            return false
        }
        return lhs == rhs
    }
}

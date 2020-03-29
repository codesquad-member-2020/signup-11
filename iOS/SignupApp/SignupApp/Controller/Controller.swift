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
    
    static func isNotCorrectLength(min: Int = 1, max: Int, count: Int?) -> Bool {
        guard let count = count else { return false }
        return min > count || max < count
    }
    
    private static let correctIDPattern = "^[a-z0-9_\\-]{5,20}$"
    static func isNotCorrectID(_ text: String?) -> Bool {
        guard let text = text, text.range(of: correctIDPattern,
                                          options: .regularExpression) == nil
        else { return false }
        return true
    }
    
    static func isOverlappedID(_ id: String?, resultHandler: @escaping (Bool?) -> ()) {
        guard let id = id else { return }
        Network.excuteURLSession(method: .get,
                                 from: "\(SignupURL.urlStringUserIDInfo)\(id)", data: nil) { data in
            guard let data = data else { return }
            guard let idResponse = DataCoder.decodeJSONData(type: Response.self,
                                                          data: data,
                                                          dateDecodingStrategy: nil) else { return }
                                    resultHandler(idResponse.success)
        }
    }
    
    private static let hasUpperCaseLetterPattern = "[A-Z]"
    static func hasNoUpperCaseLetter(_ text: String?) -> Bool {
        guard let text = text else { return false }
        let range = NSRange(location: 0, length: text.count)
        let regex = try! NSRegularExpression(pattern: hasUpperCaseLetterPattern)
        guard regex.firstMatch(in: text, range: range) == nil
            else { return false }
        return true
    }
    
    private static let hasNumberPattern = "[0-9]"
    static func hasNoNumber(_ text: String?) -> Bool {
        guard let text = text else { return false }
        let range = NSRange(location: 0, length: text.count)
        let regex = try! NSRegularExpression(pattern: hasNumberPattern)
        guard regex.firstMatch(in: text, range: range) == nil
            else { return false }
        return true
    }
    
    private static let hasSpecialCharacterPattern = "[!@#$%]"
    static func hasNoSpecialCharacter(_ text: String?) -> Bool {
        guard let text = text else { return false }
        let range = NSRange(location: 0, length: text.count)
        let regex = try! NSRegularExpression(pattern: hasSpecialCharacterPattern)
        guard regex.firstMatch(in: text, range: range) == nil
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
    
    private static let spaceCharacterPattern = "[\\s]"
    static func isNoHaveSpace(_ text: String?) -> Bool {
        guard let text = text else { return false }
        let range = NSRange(location: 0, length: text.count)
        let regex = try! NSRegularExpression(pattern: spaceCharacterPattern)
        
        guard regex.firstMatch(in: text, range: range) == nil else { return false }
        return true
    }
}

//
//  RepasswordPresenterTests.swift
//  SignupAppTests
//
//  Created by kimdo2297 on 2020/07/02.
//  Copyright © 2020 Jason. All rights reserved.
//

import XCTest
import UIKit
@testable import SignupApp

private final class RePasswordableViewSpy: UIView, RePasswordableView {
    var passwordTextableView: SignupTextableView? = SignupField()
    var isCorrect: Bool = false
    var text: String? = nil
    var message: String? = nil
    
    func setWrongCase(message: String) {
        self.message = message
    }
    
    func setCorrectCase(message: String) {
        self.message = message
    }
}

final class RepasswordPresenterTests: XCTestCase {
    private var presenter: RePasswordPresenter!
    
    override func setUpWithError() throws {
        presenter = RePasswordPresenter()
    }

    override func tearDownWithError() throws {
        presenter = nil
    }
    
    func test_이전_패스워드가_조건이_맞지_않을_때() throws {
        //given
        let spy = RePasswordableViewSpy()
        spy.text = "1111"
        spy.passwordTextableView?.isCorrect = false
        
        //when
        presenter.validateText(of: spy)
        
        //then
        let result = try XCTUnwrap(spy.message)
        XCTAssertEqual(result, "이전 비밀번호를 먼저 올바르게 입력해주시기 바랍니다.")
    }
    
    func test_이전_패스워드와_일치하지_않을_때() throws {
        //given
        let spy = RePasswordableViewSpy()
        spy.passwordTextableView?.isCorrect = true
        spy.passwordTextableView?.text = "1111Jason@"
        spy.text = "1111"
        
        //when
        presenter.validateText(of: spy)
        
        //then
        let result = try XCTUnwrap(spy.message)
        XCTAssertEqual(result, "비밀번호가 일치하지 않습니다.")
    }
    
    func test_이전_패스워드와_일치할_때() throws {
        //given
        let spy = RePasswordableViewSpy()
        spy.passwordTextableView?.isCorrect = true
        spy.passwordTextableView?.text = "1111Jason@"
        spy.text = "1111Jason@"
        
        //when
        presenter.validateText(of: spy)
        
        //then
        let result = try XCTUnwrap(spy.message)
        XCTAssertEqual(result, "비밀번호가 일치합니다.")
    }
}

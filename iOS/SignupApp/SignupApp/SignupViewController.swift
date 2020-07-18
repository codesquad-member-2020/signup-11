//
//  ViewController.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/24.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class SignupViewController: UIViewController {
    @IBOutlet weak var idTextField: IDField!
    @IBOutlet weak var pwTextField: SignupField!
    @IBOutlet weak var pwAgainTextField: RePasswordField!
    @IBOutlet weak var nameTextField: SignupField!
    @IBOutlet weak var completeButton: CompleteButton!
    private lazy var textFields = [idTextField, pwTextField, pwAgainTextField, nameTextField]
    
    private let idTextFieldDelegate = IDPresenter()
    private let pwAgainTextFieldDelegate = RePasswordPresenter()
    private let nameTextFieldDelegate = NamePresenter()
    private let pwTextFieldDelegate = PasswordPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureRePasswordField()
        configureDelegates()
        configureNextResponders()
    }
    
    private func configureRePasswordField() {
        pwAgainTextField.passwordTextableView = pwTextField
    }
    
    private func configureDelegates() {
        cofigureUITextFieldDelegates()
        configureSignupFieldDelegates()
        configureNextButtonDelegate()
    }
    
    private func cofigureUITextFieldDelegates() {
        idTextField.delegate = idTextFieldDelegate
        pwTextField.delegate = pwTextFieldDelegate
        pwAgainTextField.delegate = pwAgainTextFieldDelegate
        nameTextField.delegate = nameTextFieldDelegate
    }
    
    private func configureSignupFieldDelegates() {
        idTextField.signupFieldDelegate = self
        pwTextField.signupFieldDelegate = self
        pwAgainTextField.signupFieldDelegate = self
        nameTextField.signupFieldDelegate = self
    }
    
    private func configureNextButtonDelegate() {
        completeButton.delegate = self
    }
    
    private func configureNextResponders() {
        idTextField.nextResonder = pwTextField
        pwTextField.nextResonder = pwAgainTextField
        pwAgainTextField.nextResonder = nameTextField
        nameTextField.nextResonder = completeButton
    }
    
    @IBAction func validatationButtonDidTouch(_ sender: OverlapValidationButton) {
        guard idTextField.status == .isCorrectButNotCheckOverlapValidation else { return }
        
        sender.validateOverlappedID(idTextField.text) { isOverlapped in
            if isOverlapped {
                DispatchQueue.main.async {
                    self.idTextField.setWrongCaseOverlappedID()
                }
                return
            }
            DispatchQueue.main.async {
                self.idTextField.setCorrectCase()
                self.idTextField.status = .isCorrect
            }
        }
    }
}

extension SignupViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension SignupViewController: CompleteButtonDelegate {
    func completeButtonBecomeFirstResponder() {
        if completeButton.isEnabled {
            createUser { result in
                guard let result = result, result else { return }
                DispatchQueue.main.async {
                    self.showLoginViewController()
                }
            }
        } else {
            invalidTextFieldBecomeFirstResponder()
        }
    }
    
    private func invalidTextFieldBecomeFirstResponder() {
        for textField in textFields {
            guard let textField = textField else { return }
            if !textField.isCorrect {
                textField.becomeFirstResponder()
                return
            }
        }
    }
    
    func completeButtonTapped() {
        createUser { result in
            guard let result = result, result else { return }
            DispatchQueue.main.async {
                self.showLoginViewController()
            }
        }
    }
    
    private func createUser(resultHandler: @escaping (Bool?) -> ()) {
        let user = User(userId: idTextField.text!,
                        password: pwTextField.text!,
                        name: nameTextField.text!)
        guard let jsonData = DataCoder.encodeJSONData(user) else { return }
        
        NetworkManager.excuteURLSession(
            method: .post,
            from: SignupURL.urlStringUserIntitatationInfo,
            data: jsonData
        ) { data in
            guard let data = data else { return }
            guard let createUserResponse = DataCoder.decodeJSONData(
                type: CreateUserResponse.self,
                data: data,
                dateDecodingStrategy: nil) else { return }
            
            resultHandler(createUserResponse.success)
        }
    }
    
    private func showLoginViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let loginViewController = storyboard.instantiateViewController(identifier: "loginViewController")
        navigationController?.pushViewController(loginViewController,
                                                 animated: true)
    }
}

extension SignupViewController: SignupFieldDelegate {
    func signupFieldIsCorrectDidChange() {
        changeNextButton()
    }
    
    private func changeNextButton() {
        if isAllCorrect() {
            completeButton.makeEnabled()
        } else {
            completeButton.makeDisabled()
        }
    }
    
    private func isAllCorrect() -> Bool {
        for textField in textFields {
            guard let textField = textField else { return false }
            guard textField.isCorrect else { return false }
        }
        return true
    }
}

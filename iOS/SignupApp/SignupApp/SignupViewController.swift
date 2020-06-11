//
//  ViewController.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/24.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class SignupViewController: UIViewController {
    @IBOutlet weak var idTextField: SignupField!
    @IBOutlet weak var pwTextField: SignupField!
    @IBOutlet weak var pwAgainTextField: RePasswordField!
    @IBOutlet weak var nameTextField: SignupField!
    @IBOutlet weak var completeButton: CompleteButton!
    private lazy var textFields = [idTextField, pwTextField, pwAgainTextField, nameTextField]
    
    private let idTextFieldDelegate = IDValidator()
    private let pwAgainTextFieldDelegate = RePasswordValidator()
    private let nameTextFieldDelegate = NameValidator()
    private let pwTextFieldDelegate = PasswordValidator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        setNextResponders()
    }
    
    private func setDelegates() {
        setUITextFieldDelegates()
        setSignupFieldDelegates()
        setNextButtonDelegate()
    }
    
    private func setUITextFieldDelegates() {
        idTextField.delegate = idTextFieldDelegate
        pwTextField.delegate = pwTextFieldDelegate
        pwAgainTextField.delegate = pwAgainTextFieldDelegate
        nameTextField.delegate = nameTextFieldDelegate
    }
    
    private func setSignupFieldDelegates() {
        idTextField.signupFieldDelegate = self
        pwTextField.signupFieldDelegate = self
        pwAgainTextField.signupFieldDelegate = self
        nameTextField.signupFieldDelegate = self
    }

    private func setNextButtonDelegate() {
        completeButton.delegate = self
    }
    
    private func setNextResponders() {
        idTextField.nextResonder = pwTextField
        pwTextField.nextResonder = pwAgainTextField
        pwAgainTextField.nextResonder = nameTextField
        nameTextField.nextResonder = completeButton
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
        NetworkManager.excuteURLSession(method: .post,
                                        from: SignupURL.urlStringUserIntitatationInfo,
                                        data: jsonData) { data in
                                            guard let data = data else { return }
                                            guard let userResponse = DataCoder.decodeJSONData(type: Response.self,
                                                                                              data: data,
                                                                                              dateDecodingStrategy: nil)
                                                else { return }
                                            resultHandler(userResponse.success)
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
            completeButton.enabled()
        } else {
            completeButton.disabled()
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

//
//  ViewController.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/24.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    @IBOutlet weak var idTextField: SignupField!
    @IBOutlet weak var pwTextField: SignupField!
    @IBOutlet weak var pwAgainTextField: RePasswordField!
    @IBOutlet weak var nameTextField: SignupField!
    @IBOutlet weak var nextButton: NextButton!
    private lazy var textFields = [idTextField, pwTextField, pwAgainTextField, nameTextField]
    
    private let idTextFieldDelegate = IDValidator()
    private let pwAgainTextFieldDelegate = RePasswordValidator()
    private let nameTextFieldDelegate = NameValidator()
    private let pwTextFieldDelegate = PasswordValidator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        setNextResponders()
        setObserver()
    }
    
    private func setDelegates() {
        idTextField.delegate = idTextFieldDelegate
        pwTextField.delegate = pwTextFieldDelegate
        pwAgainTextField.delegate = pwAgainTextFieldDelegate
        nameTextField.delegate = nameTextFieldDelegate
        nextButton.delegate = self
    }
    
    private func setNextResponders() {
        idTextField.nextResonder = pwTextField
        pwTextField.nextResonder = pwAgainTextField
        pwAgainTextField.nextResonder = nameTextField
        nameTextField.nextResonder = nextButton
    }
    
    private func setObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changeNextButton),
                                               name: SignupField.notificationIsCorrectDidChange,
                                               object: nil)
    }
    
    @objc func changeNextButton() {
        if isAllCorrect() {
            nextButton.enabled()
        } else {
            nextButton.disabled()
        }
    }
    
    private func isAllCorrect() -> Bool {
        for textField in textFields {
            guard let textField = textField else { return false }
            if !textField.isCorrect {
                return false
            }
        }
        return true
    }
}

extension SignupViewController: NextButtonDelegate {
    func nextButtonBecomeFirstResponder() {
        if nextButton.isEnabled {
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
    
    func nextButtonTapped() {
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

//
//  ViewController.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/24.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class SignupViewController: UIViewController, ToastShowable {
    @IBOutlet weak var idTextField: IDField!
    @IBOutlet weak var pwTextField: SignupField!
    @IBOutlet weak var pwAgainTextField: RePasswordField!
    @IBOutlet weak var nameTextField: SignupField!
    @IBOutlet weak var completeButton: CompleteButton!
    private lazy var textFields = [idTextField, pwTextField, pwAgainTextField, nameTextField]
    
    private let userCreationUseCase = UserCreationUseCase(networkDispatcher: NetworkManager())
    private let idPresenter = IDPresenter()
    private let passwordPresenter = PasswordPresenter()
    private let rePasswordPresenter = RePasswordPresenter()
    private let namePresenter = NamePresenter()
    
    var toastLabel: ToastLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureRePasswordField()
        configureDelegates()
        configureNextResponders()
        configureToastLabel()
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
        idTextField.delegate = idPresenter
        pwTextField.delegate = passwordPresenter
        pwAgainTextField.delegate = rePasswordPresenter
        nameTextField.delegate = namePresenter
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
    
    private func configureToastLabel() {
        toastLabel = ToastLabel(
            frame: CGRect(
                x: 10,
                y: self.view.frame.size.height - 100,
                width: view.frame.size.width - 2 * 10,
                height: 35)
        )
    }
    
    @IBAction func validatationButtonDidTouch(_ sender: OverlapValidationButton) {
        guard idTextField.isRequiredOverlapValidation else { return }
        
        // 중복확인을 뷰가 하면 안되지, 네트워크 연동인데. 네트워크 객체하도록 코드를 작성하자.
        sender.validateOverlappedID(idTextField.text) { isOverlapped in
            if isOverlapped {
                self.setWrongCaseIDTextFieldForOverlaped()
                return
            }
            self.setCorrectCaseIDTextField()
        }
    }
    
    private func setWrongCaseIDTextFieldForOverlaped() {
        DispatchQueue.main.async {
            self.idTextField.setWrongCaseOverlappedID()
        }
    }
    
    private func setCorrectCaseIDTextField() {
        DispatchQueue.main.async {
            self.idTextField.setCorrectCase()
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
        guard completeButton.isEnabled else {
            invalidTextFieldBecomeFirstResponder()
            return
        }
        
        completeButtonTapped()
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
        guard let jsonData = User(userId: idTextField.text!,
        password: pwTextField.text!,
        name: nameTextField.text!).toJSON else { return }
        
        userCreationUseCase.createUser(with: UserCreationRequest(data: jsonData)) { result in
            guard result else { return }
            
            self.showToast(by: result)
        }
    }
    
    func showToast(by result: Bool) {
        DispatchQueue.main.async {
            result ? self.show(message: "회원가입 성공!") : self.show(message: "통신오류로 인한 회원가입 실패")
        }
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

//
//  CreateAccountViewController.swift
//  TwitterCloneApp
//
//  Created by Yennifer Hurtado Arce on 13/10/22.
//

import Foundation
import UIKit

class CreateAccountViewController: UIViewController {
    
    //MARK: Properties
    let createAccountView = CreateAccountView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setLayouts()
        initDelegate()
    }
}

//MARK: DELEGATE
extension CreateAccountViewController: CreateAccountViewDelegate {
    
    func nextButtonEnabled() {
        let userTextField = createAccountView.nameTextField
        let birth = createAccountView.birthTextField
        let number = createAccountView.numberOrUserTextField
        
        userTextField.text?.isEmpty ?? false && birth.text?.isEmpty ?? false && number.text?.isEmpty ?? false ?
        on_offButton(
            backgroundColor: .systemGray,
            titleColor: .systemGray4,
            isEnable: false) :
        on_offButton(
            backgroundColor: .black,
            titleColor: .white,
            isEnable: true)
    }
    
    func on_offButton(backgroundColor: UIColor,
                      titleColor: UIColor,
                      isEnable: Bool) {
        let nextButton = createAccountView.nextButton
        nextButton.backgroundColor = backgroundColor
        nextButton.setTitleColor(titleColor, for: .normal)
        nextButton.isEnabled = isEnable
    }
    
    func showtopLabel(_ textField: UITextField, _ label: UILabel) {
        textField.text?.isEmpty ?? false ?
        isLabelHidden(hide: true, label: label) :
        isLabelHidden(hide: false, label: label)
    }
    
    func nextButton() {
        print("prueba")
    }
    
    func initDelegate() {
        createAccountView.delegate = self
    }
}

//MARK: HELPERS
extension CreateAccountViewController {
    
    func isLabelHidden(hide: Bool, label: UILabel) {
        label.isHidden = hide
    }
}

//MARK: AutoLayouts
private extension CreateAccountViewController {
    
    func setLayouts() {
        createAccountView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                                 bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                 left: view.leftAnchor,
                                 right: view.rightAnchor)
    }
    
    func addSubViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(createAccountView)
    }
}

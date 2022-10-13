//
//  RegistrationViewController.swift
//  TwitterCloneApp
//
//  Created by Yennifer Hurtado Arce on 21/08/22.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Properties
    private let loginView = LoginView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setLayouts()
        initDelegate()
        tapHideKeywoard()
    }
}

// MARK: - Helpers
extension LoginViewController {
    
    func tapHideKeywoard() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
    
    func initDelegate() {
        loginView.delegate = self
    }
    
    func on_offButton(backgroundColor: UIColor,
                      titleColor: UIColor,
                      isEnable: Bool) {
        let nextButton = loginView.nextButton
        nextButton.backgroundColor = backgroundColor
        nextButton.setTitleColor(titleColor, for: .normal)
        nextButton.isEnabled = isEnable
    }
}

//MARK: Registration Delegate
extension LoginViewController: LoginViewDelegate {
    
    func enableNextButton() {
        let userTextField = loginView.userTextField
        
        userTextField.text?.isEmpty ?? false ?
        on_offButton(backgroundColor: .systemGray,
                     titleColor: .systemGray4, isEnable: false) :
        on_offButton(backgroundColor: .black,
                     titleColor: .white, isEnable: true)
    }
    
    func backToLogin() {
        dismiss(animated: true)
    }
    
    func presentRecoverPassword() {
        
    }
    
    func validateAccount() {

    }
}


//MARK: AutoLayouts
private extension LoginViewController {
    
    func setLayouts() {
        view.backgroundColor = .systemBackground
        loginView.anchor(top: view.topAnchor, bottom: view.bottomAnchor,
                                left: view.leftAnchor, right: view.rightAnchor)
    }
    func addSubViews() {
        view.addSubview(loginView)
    }
}

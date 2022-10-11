//
//  LoginViewController.swift
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
        setLayouts()
        initDelegate()
    }
}

// MARK: - DELEGATE
extension LoginViewController: LoginViewDelegate {
    
    func continueWithGoogle() {
        
    }
    
    func continueWithApple() {
        
    }
    
    func createAccount() {
        
    }
    
    func pushToLoginView() {
        let controller = RegistrationViewController()
        navigationController?.pushViewController(controller,animated: true)
    }
    
    func initDelegate() {
        loginView.delegate = self
    }
}

// MARK: - LAYOUTS
private extension LoginViewController {
    func setLayouts() {
        view.addSubview(loginView)
        navigationItem.titleView = loginView.mainLogoImageView
        loginView.anchor(top: view.topAnchor, bottom: view.bottomAnchor,
                         left: view.leftAnchor, right: view.rightAnchor)
    }
}

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
        addSubViews()
        setLayouts()
        tapHideKeywoard()
        initDelegate()
    }
}
// MARK: - Delegate
extension LoginViewController: LoginViewDelegate {
    func initDelegate() {
        loginView.delegate = self
    }
    
    func handleLogin() {
        print("login")
    }
    
    func handleSignIn() {
        print("sign in")
    }
}

// MARK: - HELPERS
extension LoginViewController {
    func tapHideKeywoard() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
}

// MARK: - LAYOUTS
private extension LoginViewController {
    func setLayouts() {
        loginView.anchor(top: view.topAnchor, bottom: view.bottomAnchor,
                         left: view.leftAnchor, right: view.rightAnchor)
    }
    
    func addSubViews() {
        view.addSubview(loginView)
    }
}

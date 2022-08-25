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
    }

}

// MARK: - Layouts

private extension LoginViewController {
    
    func setLayouts() {
        loginView.anchor(top: view.topAnchor, bottom: view.bottomAnchor,
                         left: view.leftAnchor, right: view.rightAnchor)
    }
    
    func addSubViews() {
        view.addSubview(loginView)
    }
}



//
//  LoginViewController.swift
//  TwitterCloneApp
//
//  Created by Yennifer Hurtado Arce on 21/08/22.
//

import UIKit

class SignInViewController: UIViewController {

    // MARK: - Properties
    private let signInView = SignInView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayouts()
        initDelegate()
    }
}

// MARK: - DELEGATE
extension SignInViewController: SignInViewDelegate {
    
    func continueWithGoogle() {
        print("google")
    }
    
    func continueWithApple() {
        print("apple")
    }
    
    func pushToCreateAccountView() {
        let controller = CreateAccountViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func presentLoginView() {
        let controller = LoginViewController()
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
    
    func initDelegate() {
        signInView.delegate = self
    }
}

// MARK: - LAYOUTS
private extension SignInViewController {
    func setLayouts() {
        view.addSubview(signInView)
        navigationItem.titleView = signInView.mainLogoImageView
        signInView.anchor(top: view.topAnchor, bottom: view.bottomAnchor,
                         left: view.leftAnchor, right: view.rightAnchor)
    }
}

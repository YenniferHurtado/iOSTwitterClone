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
    private let viewModel = SignInViewModel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayouts()
        initDelegate()
        signInSuccess()
    }
}

// MARK: - HELPERS
private extension SignInViewController {
    func signInSuccess() {
        viewModel.onSignInSuccess = { [weak self] in
            self?.navigationController?.pushViewController(MainTabBarViewController(), animated: true)
        }
    }
}

// MARK: - DELEGATE
extension SignInViewController: SignInViewDelegate {
    
    func continueWithGoogle() {
        viewModel.startSocialSignIn(for: .google, view: self)
    }
    
    func continueWithApple() {
        viewModel.startSocialSignIn(for: .apple, view: self)
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

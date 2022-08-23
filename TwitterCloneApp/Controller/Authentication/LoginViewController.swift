//
//  LoginViewController.swift
//  TwitterCloneApp
//
//  Created by Yennifer Hurtado Arce on 21/08/22.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Properties

    private let mainLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = TwitterImages.icMainTwitterLogo.image
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var emailContainerView: UIView = {
        let containerView = Components().inputContainerView(
            withImage: TwitterImages.icMailSmall.image,
            textfield: emailTextField)
        return containerView
    }()
    
    private lazy var passwordContainerView: UIView = {
        let containerView = Components().inputContainerView(
            withImage: TwitterImages.icLock.image,
            textfield: passwordTextField)
        return containerView
    }()
    
    private let emailTextField: UITextField = {
        let textField = Components().textField(
            withPlaceholder: Localizable.email_placeholder.localized)
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = Components().textField(
            withPlaceholder: Localizable.password_placeholder.localized)
        textField.isSecureTextEntry = true
        return textField
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addSubViews()
        setLayouts()
    }

}

// MARK: - Selectors

private extension LoginViewController {
    
}

// MARK: - Helpers

// MARK: - Layouts

private extension LoginViewController {
    
    func configureUI() {
        view.backgroundColor = .twitterBlue
    }
    
    func setLayouts() {
        mainLogoImageView.centerX(inView: view,
                                  topAnchor: view.safeAreaLayoutGuide.topAnchor)
        stackView.anchor(top: mainLogoImageView.bottomAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor,
                         height: 100)
    }
    
    func addSubViews() {
        view.addSubview(mainLogoImageView)
        view.addSubview(stackView)
        stackView.addArrangedSubview(emailContainerView)
        stackView.addArrangedSubview(passwordContainerView)
    }
}



//
//  LoginView.swift
//  TwitterCloneApp
//
//  Created by Yennifer Hurtado Arce on 25/08/22.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func handleLogin()
    func handleShowSignUp()
}

class LoginView: UIView {
        
    weak var delegate: LoginViewDelegate?

    //MARK: UI Elements
    private lazy var mainLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = TwitterImages.icMainTwitterLogo.image
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var emailContainerView: UIView = {
        let containerView = Components.inputContainerLoginView(
            withImage: TwitterImages.icMailSmall.image,
            textfield: emailTextField)
        return containerView
    }()
    
    private lazy var passwordContainerView: UIView = {
        let containerView = Components.inputContainerLoginView(
            withImage: TwitterImages.icLock.image,
            textfield: passwordTextField)
        return containerView
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = Components.textFieldLoginView(
            withPlaceholder: Localizable.email_placeholder.localized)
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = Components.textFieldLoginView(
            withPlaceholder: Localizable.password_placeholder.localized)
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Localizable.log_in_button.localized, for: .normal)
        button.setTitleColor(UIColor.twitterBlue, for: .normal)
        button.titleLabel?.font = .bodyBold
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handlelogin), for: .touchUpInside)
        return button
    }()
    
    private lazy var dontHaveAccountButton: UIButton = {
        let button = Components.attributedButton(
            Localizable.dont_have_account_text.localized,
            " \(Localizable.sign_in_text.localized)")
        button.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        addSubViews()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Selectors
private extension LoginView {
    
    @objc func handlelogin() {
        delegate?.handleLogin()
    }
    
    @objc func handleSignIn() {
        delegate?.handleShowSignUp()
    }
}

//MARK: AutoLayouts
private extension LoginView {

    func configureUI() {
        backgroundColor = .twitterBlue
        loginButton.addCornerRadius(5)
    }

    func setLayouts() {
        mainLogoImageView.centerX(inView: self,
                                  topAnchor: safeAreaLayoutGuide.topAnchor)
        stackView.anchor(top: mainLogoImageView.bottomAnchor,
                         left: leftAnchor, paddingLeft: 16,
                         right: rightAnchor, paddingRight: 16,
                         height: 180)
        dontHaveAccountButton.anchor(bottom: safeAreaLayoutGuide.bottomAnchor, paddingBottom: 16,
                                     left: leftAnchor, paddingLeft: 40,
                                     right: rightAnchor, paddingRight: 40)
    }

    func addSubViews() {
        addSubview(mainLogoImageView)
        addSubview(stackView)
        stackView.addArrangedSubview(emailContainerView)
        stackView.addArrangedSubview(passwordContainerView)
        stackView.addArrangedSubview(loginButton)
        addSubview(dontHaveAccountButton)
    }
}


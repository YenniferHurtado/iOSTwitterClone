//
//  LoginView.swift
//  TwitterCloneApp
//
//  Created by Yennifer Hurtado Arce on 25/08/22.
//

import UIKit

class LoginView: UIView {
    
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
        stackView.spacing = 20
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

private extension LoginView {
    
    func configureUI() {
        backgroundColor = .twitterBlue
    }
    
    func setLayouts() {
        mainLogoImageView.centerX(inView: self,
                                  topAnchor: safeAreaLayoutGuide.topAnchor)
        stackView.anchor(top: mainLogoImageView.bottomAnchor,
                         left: leftAnchor, paddingLeft: 16,
                         right: rightAnchor, paddingRight: 16,
                         height: 120)
    }
    
    func addSubViews() {
        addSubview(mainLogoImageView)
        addSubview(stackView)
        stackView.addArrangedSubview(emailContainerView)
        stackView.addArrangedSubview(passwordContainerView)
    }
}

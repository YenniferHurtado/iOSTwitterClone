//
//  RegistrationView.swift
//  TwitterCloneApp
//
//  Created by Yennifer Hurtado Arce on 7/10/22.
//

import UIKit

protocol RegistrationViewDelegate: AnyObject {
    func backToLogin()
}

class RegistrationView: UIView {
 
    //MARK: Properties
    weak var delegate: RegistrationViewDelegate?
    
    //MARK: UI Elements
    private lazy var plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(TwitterImages.icPlusPhoto.image, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    //MARK: ContainerView
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
    
    private lazy var fullNameContainterView: UIView = {
        let containerView = Components.inputContainerLoginView(
            withImage: TwitterImages.icPerson.image,
            textfield: fullNameTextfield)
        return containerView
    }()
    
    private lazy var usernameContainterView: UIView = {
        let containerView = Components.inputContainerLoginView(
            withImage: TwitterImages.icPerson.image,
            textfield: usernameTextfield)
        return containerView
    }()
    
    //MARK: TextField
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
    
    private lazy var fullNameTextfield: UITextField = {
        let textField = Components.textFieldLoginView(
            withPlaceholder: Localizable.full_name_placeholder.localized)
        return textField
    }()
    
    private lazy var usernameTextfield: UITextField = {
        let textField = Components.textFieldLoginView(
            withPlaceholder: Localizable.username_placeholder.localized)
        return textField
    }()
    
    //MARK: Buttons
    private lazy var signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Localizable.sign_in_text.localized, for: .normal)
        button.setTitleColor(UIColor.twitterBlue, for: .normal)
        button.titleLabel?.font = .bodyBold
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        return button
    }()
    
    private lazy var alReadyHaveAccountButton: UIButton = {
        let button = Components.attributedButton(
            Localizable.already_have_account_button.localized,
            " \(Localizable.log_in_button.localized)")
        button.addTarget(self, action: #selector(tapBackToLoginView), for: .touchUpInside)
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

//MARK: Delegate
private extension RegistrationView {
    @objc func tapBackToLoginView() {
        delegate?.backToLogin()
    }
}

//MARK: AutoLayouts
private extension RegistrationView {
    
    func configureUI() {
        signInButton.addCornerRadius(5)
    }
    
    func setLayouts() {
        plusPhotoButton.centerX(inView: self,
                                topAnchor: safeAreaLayoutGuide.topAnchor)
        stackView.anchor(top: plusPhotoButton.bottomAnchor, paddingTop: 20,
                         left: leftAnchor, paddingLeft: 16,
                         right: rightAnchor, paddingRight: 16,
                         height: 325)
        alReadyHaveAccountButton.anchor(bottom: safeAreaLayoutGuide.bottomAnchor, paddingBottom: 16,
                                     left: leftAnchor, paddingLeft: 40,
                                     right: rightAnchor, paddingRight: 40)
    }
    
    func addSubViews() {
        addSubview(plusPhotoButton)
        addSubview(stackView)
        stackView.addArrangedSubview(emailContainerView)
        stackView.addArrangedSubview(passwordContainerView)
        stackView.addArrangedSubview(fullNameContainterView)
        stackView.addArrangedSubview(usernameContainterView)
        stackView.addArrangedSubview(signInButton)
        addSubview(alReadyHaveAccountButton)
    }
}

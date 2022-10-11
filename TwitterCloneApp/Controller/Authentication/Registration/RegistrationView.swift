//
//  RegistrationView.swift
//  TwitterCloneApp
//
//  Created by Yennifer Hurtado Arce on 7/10/22.
//

import UIKit

protocol RegistrationViewDelegate: AnyObject {
    func backToLogin()
    func handleSignIn()
    func addProfileImageView()
}

class RegistrationView: UIView {
 
    //MARK: Properties
    weak var delegate: RegistrationViewDelegate?
    let pickerView = UIImagePickerController()
    
    //MARK: UI Elements
    lazy var plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.addCornerRadius(65)
        button.imageView?.clipsToBounds = true
        button.imageView?.contentMode = .scaleAspectFill
        button.setImage(TwitterImages.icPlusPhoto.image, for: .normal)
        button.addTarget(self, action: #selector(tapAddPhotoProfile),
                         for: .touchUpInside)
        return button
    }()
    
//    private lazy var stackView: UIStackView = {
//        let subViewsInside = [emailContainerView, passwordContainerView, fullNameContainterView,
//                              usernameContainterView, signInButton]
//        let stackView = UIStackView(arrangedSubviews: subViewsInside)
//        stackView.axis = .vertical
//        stackView.spacing = 20
//        stackView.distribution = .fillEqually
//        return stackView
//    }()
    
    //MARK: ContainerView
//    private lazy var emailContainerView: UIView = {
//        let containerView = Components.inputContainerView(
//            withImage: TwitterImages.icMailSmall.image,
//            textfield: emailTextField)
//        return containerView
//    }()
//
//    private lazy var passwordContainerView: UIView = {
//        let containerView = Components.inputContainerView(
//            withImage: TwitterImages.icLock.image,
//            textfield: passwordTextField)
//        return containerView
//    }()
//
//    private lazy var fullNameContainterView: UIView = {
//        let containerView = Components.inputContainerView(
//            withImage: TwitterImages.icPerson.image,
//            textfield: fullNameTextfield)
//        return containerView
//    }()
//
//    private lazy var usernameContainterView: UIView = {
//        let containerView = Components.inputContainerView(
//            withImage: TwitterImages.icPerson.image,
//            textfield: usernameTextfield)
//        return containerView
//    }()
    
    //MARK: TextField
    private lazy var emailTextField: UITextField = {
        let textField = Components.textFieldView(
            withPlaceholder: Localizable.email_placeholder.localized)
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = Components.textFieldView(
            withPlaceholder: Localizable.password_placeholder.localized)
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var fullNameTextfield: UITextField = {
        let textField = Components.textFieldView(
            withPlaceholder: Localizable.full_name_placeholder.localized)
        return textField
    }()
    
    private lazy var usernameTextfield: UITextField = {
        let textField = Components.textFieldView(
            withPlaceholder: Localizable.username_placeholder.localized)
        return textField
    }()
    
    //MARK: Buttons
    
    private lazy var alReadyHaveAccountButton: UIButton = {
        let button = Components.attributedButton(
            Localizable.already_have_account_button.localized,
            " \(Localizable.log_in_button.localized)")
        button.addTarget(self, action: #selector(tapBackToLoginView),
                         for: .touchUpInside)
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
private extension RegistrationView {
    @objc func handleSignIn() {
        delegate?.handleSignIn()
    }
    @objc func tapBackToLoginView() {
        delegate?.backToLogin()
    }
    @objc func tapAddPhotoProfile() {
        delegate?.addProfileImageView()
    }
}

//MARK: AutoLayouts
private extension RegistrationView {
    func configureUI() {
    }
    
    func addSubViews() {
        addSubview(plusPhotoButton)
//        addSubview(stackView)
        addSubview(alReadyHaveAccountButton)
    }
    
    func setLayouts() {
        plusPhotoButton.centerX(inView: self, topAnchor: safeAreaLayoutGuide.topAnchor)
        plusPhotoButton.setDimensions(width: 128, height: 128)
//        stackView.anchor(top: plusPhotoButton.bottomAnchor, paddingTop: 20,
//                         left: leftAnchor, paddingLeft: 16,
//                         right: rightAnchor, paddingRight: 16, height: 325)
//        alReadyHaveAccountButton.anchor(bottom: safeAreaLayoutGuide.bottomAnchor, paddingBottom: 16,
//                                        left: leftAnchor, paddingLeft: 40,
//                                        right: rightAnchor, paddingRight: 40)
    }
}

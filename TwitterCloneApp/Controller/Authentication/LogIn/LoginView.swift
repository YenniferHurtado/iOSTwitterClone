//
//  RegistrationView.swift
//  TwitterCloneApp
//
//  Created by Yennifer Hurtado Arce on 7/10/22.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func presentRecoverPassword()
    func validateAccount()
    func backToLogin()
    func enableNextButton()
}

class LoginView: UIView {
 
    //MARK: Properties
    weak var delegate: LoginViewDelegate?
    
    //MARK: UI Elements
    lazy var mainLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = TwitterImages.icTwitterLogoBlue.image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var cancelBackButton: UIButton = {
        let button = UIButton()
        button.setTitle(Localizable.cancel_button.localized,
                        for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self,
                         action: #selector(tapCancelButton),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var mainTextLabel: UILabel = {
        let label = UILabel()
        label.text = Localizable.main_text_register_label.localized
        label.font = .titleMediumSemiBold
        label.numberOfLines = 0
        return label
    }()
    
    lazy var userTextField: UITextField = {
        let textField = Components.textField(
            withPlaceholder: Localizable.username_placeholder.localized)
        textField.addTarget(self,
                            action: #selector(textFieldDidChange(_:)),
                            for: .editingChanged)
        textField.textColor = .twitterBlue
        return textField
    }()
    
    //MARK: Buttons
    private lazy var forgetPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Localizable.forget_password_button.localized,
                        for: .normal)
        button.titleLabel?.font = .body
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self,
                         action: #selector(didForgetPassword),
                         for: .touchUpInside)
        return button
    }()
    
    lazy var nextButton: UIButton = {
        let button = Components.nextButtonComponent()
        button.addTarget(self, action: #selector(tapNextButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Selectors
private extension LoginView {
    @objc func didForgetPassword() {
        delegate?.presentRecoverPassword()
    }
    
    @objc func tapCancelButton() {
        delegate?.backToLogin()
    }
    
    @objc func tapNextButton() {
        delegate?.validateAccount()
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        delegate?.enableNextButton()
    }
}

//MARK: AutoLayouts
private extension LoginView {
    
    func addSubViews() {
        addSubViews(views: [cancelBackButton, mainLogoImageView, mainTextLabel,
                            userTextField, forgetPasswordButton, nextButton])
    }
    
    func setLayouts() {
        cancelBackButton.anchor(top: safeAreaLayoutGuide.topAnchor, paddingTop: 15,
                                left: leftAnchor, paddingLeft: 16)
        mainLogoImageView.anchor(width: 44, height: 44)
        mainLogoImageView.centerX(inView: self)
        mainLogoImageView.centerY(inView: cancelBackButton)
        mainTextLabel.anchor(top: cancelBackButton.bottomAnchor, paddingTop: 25,
                             left: leftAnchor, paddingLeft: 32,
                             right: rightAnchor, paddingRight: 32)
        userTextField.anchor(top: mainTextLabel.bottomAnchor, paddingTop: 20,
                             left: leftAnchor, paddingLeft: 32,
                             right: rightAnchor, paddingRight: 32)
        forgetPasswordButton.anchor(bottom: safeAreaLayoutGuide.bottomAnchor, paddingBottom: 10,
                                    left: leftAnchor, paddingLeft: 32)
        nextButton.centerY(inView: forgetPasswordButton)
        nextButton.anchor(right: rightAnchor, paddingRight: 32,
                          width: 100, height: 32)
    }
}

//
//  LoginView.swift
//  TwitterCloneApp
//
//  Created by Yennifer Hurtado Arce on 25/08/22.
//

import UIKit

protocol SignInViewDelegate: AnyObject {
    func continueWithGoogle()
    func continueWithApple()
    func pushToCreateAccountView()
    func presentLoginView()
}

class SignInView: UIView {
        
    weak var delegate: SignInViewDelegate?

    //MARK: UI ELEMENTS
    lazy var mainLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = TwitterImages.icTwitterLogoBlue.image
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var mainTextLabel: UILabel = {
        let label = UILabel()
        label.text = Localizable.main_text_login_label.localized
        label.font = .title1Bold
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let subviews = [googleButton, appleButton, separatorLabel, createAccountButton,
                        termsPrivacyCookiesLabel, alreadyHaveAccountButton]
        let stackView = UIStackView(arrangedSubviews: subviews)
        stackView.axis = .vertical
        return stackView
    }()
    
    /* - UIButtons */
    private lazy var googleButton: UIButton = {
        let button = Components.templateButtonLogin(
            withImage: TwitterImages.icGoogle.image,
            titleText: Localizable.continue_google.localized,
            textColor: .black)
        button.addTarget(self, action: #selector(tapGoogleButton),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var appleButton: UIButton = {
        let button = Components.templateButtonLogin(
            withImage: TwitterImages.icApple.image,
            titleText: Localizable.continue_apple.localized,
            textColor: .black)
        button.addTarget(self, action: #selector(tapAppleButton),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var createAccountButton: UIButton = {
        let button = Components.templateButtonLogin(
            withImage: nil,
            titleText: Localizable.create_account.localized,
            textColor: .white)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(tapCreateAccountButton),
                         for: .touchUpInside)
        return button
    }()
    
    /* - UILabels */
    private lazy var separatorLabel: UILabel = {
        let label = UILabel()
        label.text = "——————————————— o ———————————————"
        label.textAlignment = .center
        label.textColor = .lightGray
        label.font = .caption2
        return label
    }()
    
    private lazy var termsPrivacyCookiesLabel: UITextView = {
        let termLink = Components.ValueLink(
            text: Localizable.terms_label.localized,
            hyperlink: Localizable.terms_link.localized)
        
        let policyLink = Components.ValueLink(
            text: Localizable.privacy_policy_label.localized,
            hyperlink: Localizable.privacy_link.localized)
        
        let cookiesLink = Components.ValueLink(
            text: Localizable.cookies_policy_label.localized,
            hyperlink: Localizable.cookies_link.localized)
        
        let label = Components.textWithHyperLinks(
            Localizable.terms_policy_cookies_label.localized,
            firstLink: termLink,
            secondLink: policyLink,
            thirdLink: cookiesLink)
        return label
    }()
    
    private lazy var alreadyHaveAccountButton: UIButton = {
        let button = Components.attributedButton(
            Localizable.already_have_account_button.localized,
            " \(Localizable.log_in_button.localized)")
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(tapLoginButton),
                         for: .touchUpInside)
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

//MARK: SELECTORS & DELEGATE
private extension SignInView {
    
    @objc func tapLoginButton() {
        delegate?.presentLoginView()
    }
    
    @objc func tapGoogleButton() {
        delegate?.continueWithGoogle()
    }
    
    @objc func tapAppleButton() {
        delegate?.continueWithApple()
    }
    
    @objc func tapCreateAccountButton() {
        delegate?.pushToCreateAccountView()
    }
}

//MARK: AUTOLAYOUTS
private extension SignInView {
    
    func setLayouts() {
        backgroundColor = .systemBackground
        mainTextLabel.centerX(inView: self)
        mainTextLabel.anchor(top: topAnchor, paddingTop: 200,
                             left: leftAnchor, paddingLeft: 32,
                             right: rightAnchor, paddingRight: 32)
        stackView.anchor(bottom: safeAreaLayoutGuide.bottomAnchor,
                         left: leftAnchor, paddingLeft: 32,
                         right: rightAnchor, paddingRight: 32)
        termsPrivacyCookiesLabel.anchor(height: 50)
        alreadyHaveAccountButton.anchor(height: 50)
    }

    func addSubViews() {
        addSubViews(views: [mainTextLabel, stackView])
        stackView.setCustomSpacing(15, after: googleButton)
        stackView.setCustomSpacing(15, after: appleButton)
        stackView.setCustomSpacing(10, after: separatorLabel)
        stackView.setCustomSpacing(20, after: createAccountButton)
        stackView.setCustomSpacing(18, after: termsPrivacyCookiesLabel)
    }
}


//
//  CreateAccountView.swift
//  TwitterCloneApp
//
//  Created by Yennifer Hurtado Arce on 13/10/22.
//

import UIKit

protocol CreateAccountViewDelegate: AnyObject {
    func nextButton()
    func showtopLabel(_ textField: UITextField, _ label: UILabel)
}

class CreateAccountView: UIView {
    
    weak var delegate: CreateAccountViewDelegate?
    
    //MARK: UI ELEMENTS
    private lazy var createAccountLabel: UILabel = {
        let label = UILabel()
        label.text = Localizable.create_account_label.localized
        label.font = .titleMediumSemiBold
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let subviews = [topLabelName, nameTextField, topLabelNumber,
                        numberOrUserTextField, topLabelBirth, birthTextField]
        let stackView = UIStackView(arrangedSubviews: subviews)
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var topLabelName: UILabel = {
        let label = UILabel()
        label.text = Localizable.name_placeholder.localized
//        label.isHidden = true
        return label
    }()
    
    lazy var topLabelNumber: UILabel = {
        let label = UILabel()
        label.text = Localizable.phone_label.localized
//        label.isHidden = true
        return label
    }()
    
    lazy var topLabelBirth: UILabel = {
        let label = UILabel()
        label.text = Localizable.birth_placeholder.localized
//        label.isHidden = true
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = Components.textField(
            withPlaceholder: Localizable.name_placeholder.localized)
        textField.addTarget(self, action: #selector(textFieldNameDidChange(_:)), for: .editingChanged)
        return textField
    }()
    
    private lazy var numberOrUserTextField: UITextField = {
        let textField = Components.textField(
            withPlaceholder: Localizable.number_or_user_placeholder.localized)
        textField.addTarget(self, action: #selector(textFieldUserDidChange(_:)), for: .editingChanged)
        return textField
    }()
    
    private lazy var birthTextField: UITextField = {
        let textField = Components.textField(
            withPlaceholder: Localizable.birth_placeholder.localized)
        textField.addTarget(self, action: #selector(textFieldBirthDidChange(_:)), for: .editingChanged)
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

//MARK: SELECTOR
private extension CreateAccountView {
    
    @objc func textFieldNameDidChange(_ textField: UITextField) {
        delegate?.showtopLabel(nameTextField, topLabelName)
    }
    
    @objc func textFieldUserDidChange(_ textField: UITextField) {
        delegate?.showtopLabel(numberOrUserTextField, topLabelName)
    }
    
    @objc func textFieldBirthDidChange(_ textField: UITextField) {
        delegate?.showtopLabel(birthTextField, topLabelName)
    }
}

//MARK: AutoLayouts
private extension CreateAccountView {
    
    func configureUI() {
        backgroundColor = .systemBackground
    }
    
    func setLayouts() {
        createAccountLabel.anchor(top: safeAreaLayoutGuide.topAnchor,
                                  left: leftAnchor, paddingLeft: 32,
                                  right: rightAnchor, paddingRight: 32, height: 60)
        stackView.anchor(top: createAccountLabel.bottomAnchor, paddingTop: 10,
                         left: leftAnchor, paddingLeft: 32,
                         right: rightAnchor, paddingRight: 32)
        topLabelName.anchor(left: stackView.leftAnchor, height: 20)
        topLabelNumber.anchor(top: nameTextField.bottomAnchor,
                              left: stackView.leftAnchor, height: 20)
        topLabelBirth.anchor(top: numberOrUserTextField.bottomAnchor,
                             left: stackView.leftAnchor, height: 20)
    }
    
    func addSubViews() {
        addSubViews(views: [createAccountLabel, stackView])
//        stackView.setCustomSpacing(50, after: nameTextField)
//        stackView.setCustomSpacing(50, after: numberOrUserTextField)
//        stackView.setCustomSpacing(50, after: birthTextField)
    }
}

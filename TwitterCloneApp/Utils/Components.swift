//
//  Components.swift
//  TwitterCloneApp
//
//  Created by Yennifer Hurtado Arce on 23/08/22.
//

import UIKit

class Components {
    
    struct ValueLink {
        var text = ""
        var hyperlink = ""
    }
    
    class func setTitleBackButton(text: String, action: Any) -> UIBarButtonItem {
        let backButton = UIBarButtonItem(title: text,
                                         style: .plain,
                                         target: nil,
                                         action: action as? Selector)
        return backButton
    }
    
    class func templateButtonLogin(withImage image: UIImage?,
                                   titleText: String,
                                   textColor: UIColor) -> UIButton {

        let loginButton = UIButton(type: .system)
        loginButton.addCornerRadius(60 / 2)
        loginButton.addBorderLine(width: 0.4, color: .gray)
        loginButton.anchor(height: 60)
     
        
        let contentView = UIView()
        contentView.isUserInteractionEnabled = false
        let iconImageView = UIImageView()
        iconImageView.image = image
        
        let label = UILabel()
        label.text = titleText
        label.font = .calloutSemiBold
        label.textColor = textColor

        loginButton.addSubview(contentView)
        contentView.addSubViews(views: [iconImageView, label])

        contentView.center(inView: loginButton)
        contentView.anchor(width: 200, height: 50)
        
        iconImageView.centerY(inView: contentView)
        iconImageView.anchor(left: contentView.leftAnchor,
                             width: 24, height: 24)
        
        label.centerY(inView: contentView)
        
        iconImageView.image != nil ?
        label.anchor(left: iconImageView.rightAnchor, paddingLeft: 15) :
        label.centerX(inView: loginButton)
        return loginButton
    }
    
    class func attributedButton(_ normalText: String, _ signInText: String) -> UIButton {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(
            string: normalText,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray,
                         NSAttributedString.Key.font: UIFont.subheadline])
        
        attributedTitle.append(NSAttributedString(
            string: signInText,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.link,
                         NSAttributedString.Key.font: UIFont.subheadline]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }
    
    class func textField(withPlaceholder placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.font = .callout
        textField.textColor = .twitterBlue
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
        
        let underline = UIView()
        underline.backgroundColor = .lightGray
        
        textField.addSubview(underline)
        textField.anchor(height: 30)
        underline.anchor(bottom: textField.bottomAnchor, paddingBottom: -10,
                         left: textField.leftAnchor,
                         right: textField.rightAnchor,
                         height: 0.75)
        return textField
    }
    
    class func textWithHyperLinks(_ allText: String,
                                  firstLink: ValueLink,
                                  secondLink: ValueLink? = nil,
                                  thirdLink: ValueLink? = nil) -> UITextView {
        
        let textView = UITextView()
        let attributedString = NSMutableAttributedString(
            string: allText,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray,
                         NSAttributedString.Key.font: UIFont.footnote]
        )
        
        attributedString.addAttribute(.link, value: firstLink.hyperlink,
                                      range: (attributedString.string as NSString).range(of: firstLink.text))

        attributedString.addAttribute(.link, value: secondLink?.hyperlink ?? "",
                                      range: (attributedString.string as NSString).range(of: secondLink?.text ?? ""))

        attributedString.addAttribute(.link, value: thirdLink?.hyperlink ?? "",
                                      range: (attributedString.string as NSString).range(of: thirdLink?.text ?? ""))
        
        textView.attributedText = attributedString
        textView.isSelectable = true
        textView.isEditable = false
        textView.delaysContentTouches = false
        textView.isScrollEnabled = false
        return textView
    }
}

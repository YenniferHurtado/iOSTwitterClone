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
    
    class func templateButtonLogin(withImage image: UIImage?,
                                   titleText: String,
                                   textColor: UIColor) -> UIButton {

        let loginButton: UIButton = {
            let button = UIButton()
            button.addCornerRadius(60 / 2)
            button.addBorderLine(width: 0.4, color: .gray)
            button.anchor(height: 60)
            return button
        }()
        
        let contentView = UIView()
        let iconImageView = UIImageView()
        iconImageView.image = image
        
        let label: UILabel = {
            let label = UILabel()
            label.text = titleText
            label.font = .calloutSemiBold
            label.textColor = textColor
            return label
        }()

        loginButton.addSubview(contentView)
        contentView.addSubview(iconImageView)
        contentView.addSubview(label)

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
    
    class func textField(withPlaceholder placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.font = .callout
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        return textField
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

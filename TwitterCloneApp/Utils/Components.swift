//
//  Components.swift
//  TwitterCloneApp
//
//  Created by Yennifer Hurtado Arce on 23/08/22.
//

import UIKit

class Components {
    
    class func inputContainerLoginView(withImage image: UIImage?,
                                       textfield: UITextField) -> UIView {
        let view = UIView()
        let imageView = UIImageView()
        let bottomBorderView = UIView()
        
        view.addSubview(imageView)
        view.addSubview(textfield)
        view.addSubview(bottomBorderView)
        
        view.anchor(height: 50)
        
        imageView.image = image
        imageView.centerY(inView: view)
        imageView.anchor(left: view.leftAnchor, paddingLeft: 8,
                         width: 24, height: 24)
        
        textfield.anchor(bottom: view.bottomAnchor, paddingBottom: 8,
                         left: imageView.rightAnchor, paddingLeft: 8,
                         right: view.rightAnchor)
        textfield.centerY(inView: view)
        
        bottomBorderView.backgroundColor = .white
        bottomBorderView.anchor(bottom: view.bottomAnchor,
                                left: view.leftAnchor, paddingLeft: 8,
                                right: view.rightAnchor, height: 0.75)        
        return view
    }
    
    class func textFieldLoginView(withPlaceholder placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.textColor = .white
        textField.font = .callout
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return textField
    }
    
    class func attributedButton(_ firstPart: String, _ secondPart: String) -> UIButton {
        let button = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(
            string: firstPart,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                         NSAttributedString.Key.font: UIFont.callout])
        
        attributedTitle.append(NSAttributedString(
            string: secondPart,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                         NSAttributedString.Key.font: UIFont.calloutBold]))
        
        return button
    }
}

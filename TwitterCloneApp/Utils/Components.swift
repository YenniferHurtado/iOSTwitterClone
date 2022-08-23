//
//  Components.swift
//  TwitterCloneApp
//
//  Created by Yennifer Hurtado Arce on 23/08/22.
//

import UIKit

class Components {
    
    func inputContainerView(withImage image: UIImage?,
                            textfield: UITextField) -> UIView {
        let view = UIView()
        let imageView = UIImageView()

        view.addSubview(imageView)
        view.addSubview(textfield)
        
        view.anchor(height: 50)
        
        imageView.image = image
        imageView.centerY(inView: view)
        imageView.anchor(left: view.leftAnchor, paddingLeft: 8,
                         width: 24, height: 24)
        
        textfield.anchor(bottom: view.bottomAnchor, paddingBottom: 8,
                         left: imageView.rightAnchor, paddingLeft: 8,
                         right: view.rightAnchor)
        textfield.centerY(inView: view)
        
        return view
    }
    
    func textField(withPlaceholder placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.textColor = .white
        textField.font = .callout
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])

        return textField
    }

}

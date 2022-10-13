//
//  UIView.swift
//  TwitterCloneApp
//
//  Created by Yennifer Hurtado Arce on 21/08/22.
//

import UIKit

extension UIView {
    
    open func addSubViews(views: [UIView]) {
        views.forEach { view in
            addSubview(view)
        }
    }
    
    func addCornerRadius(_ radius: CGFloat = 4) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    func addBorderLine(width: CGFloat = 1, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
    func makeRounded() {
        layer.masksToBounds = false
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
    
    func addShadow(
       cornerRadius: CGFloat = 16,
       shadowColor: UIColor = UIColor(white: 0.0, alpha: 0.5),
       shadowOffset: CGSize = CGSize(width: 0.0, height: 3.0),
       shadowOpacity: Float = 0.3,
       shadowRadius: CGFloat = 5) {
      
          layer.cornerRadius = cornerRadius
          layer.shadowColor = shadowColor.cgColor
          layer.shadowOffset = shadowOffset
          layer.shadowOpacity = shadowOpacity
          layer.shadowRadius = shadowRadius
    }
    
}

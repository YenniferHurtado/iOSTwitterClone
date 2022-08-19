//
//  Strings.swift
//  TwitterCloneApp
//
//  Created by Yennifer Hurtado Arce on 19/08/22.
//

import UIKit

extension String {
    
    public var localized: String {
        NSLocalizedString(self, comment: "\(self)_comment")
    }
}

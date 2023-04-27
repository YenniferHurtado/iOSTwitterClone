//
//  Cache.swift
//  TwitterCloneApp
//
//  Created by Yennifer Hurtado Arce on 14/11/22.
//

import Foundation

class Cache {
    
    class func saveStringData(value: String, key: String) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
}

//MARK: KEYS
public enum Key: String {
    case emailGoogle = "email.google"
}

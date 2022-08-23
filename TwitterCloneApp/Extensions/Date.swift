//
//  Date.swift
//  TwitterCloneApp
//
//  Created by Yennifer Hurtado Arce on 22/08/22.
//

import Foundation

extension Date {
    func getCurrentDate(_ format: String = "dd/MM/yyyy HH:mm:ss") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = .current
        return dateFormatter.string(from: Date())
    }
}

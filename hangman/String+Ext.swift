//
//  String+Ext.swift
//  hangman
//
//  Created by Rafael Plinio on 05/12/20.
//

import Foundation

extension String {
    func isValidEmail()->Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return  NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
}

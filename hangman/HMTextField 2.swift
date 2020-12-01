//
//  HMTextField.swift
//  hangman
//
//  Created by Rafael Plinio on 29/11/20.
//

import UIKit

class HMTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemBackground.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        font = UIFont(name: "Chalkboard SE", size: 20)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        backgroundColor = .systemPurple
        autocorrectionType = .no
        returnKeyType = .go
        
        placeholder = "e-mail"
        
    }

}

//
//  HMButton.swift
//  hangman
//
//  Created by Rafael Plinio on 29/11/20.
//

import UIKit

class HMButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemBackground.cgColor
        
        titleLabel?.textColor = .systemBackground
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2) //dynamic type
        titleLabel?.font = UIFont(name: "Chalkboard SE", size: 20)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}

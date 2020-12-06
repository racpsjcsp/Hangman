//
//  HMLabelVC.swift
//  hangman
//
//  Created by Rafael Plinio on 30/11/20.
//

import UIKit

class HMLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
                
        textColor = .label
        tintColor = .label
        textAlignment = .center

        font = UIFont.preferredFont(forTextStyle: .title2) //dynamic type
        font = UIFont(name: "Chalkboard SE", size: 20)
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .systemBackground
        
    }
}

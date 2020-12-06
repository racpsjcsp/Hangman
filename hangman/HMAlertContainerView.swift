//
//  HMAlertContainerView.swift
//  hangman
//
//  Created by Rafael Plinio on 01/12/20.
//

import UIKit

class HMAlertContainerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    private func configure() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 16
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.widthAnchor.constraint(equalToConstant: 280),
            self.heightAnchor.constraint(equalToConstant: 220)
        ])
    }

}

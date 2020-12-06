//
//  UIViewController+Ext.swift
//  hangman
//
//  Created by Rafael Plinio on 01/12/20.
//

import UIKit

extension UIViewController {
    
    func presentHMAlertOnMainThread(container: HMAlertContainerView, title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = HMAlertVC(container: container, title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .coverVertical
            self.present(alertVC, animated: true)
        }
    }
}

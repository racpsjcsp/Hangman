//
//  gameVC.swift
//  hangman
//
//  Created by Rafael Plinio on 29/11/20.
//

import UIKit

class GameVC: UIViewController {

    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        navigationController?.isNavigationBarHidden = false
        print("GAME viewDidLoad")
    }
    
}

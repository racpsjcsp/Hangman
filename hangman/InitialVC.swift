//
//  ViewController.swift
//  hangman
//
//  Created by Rafael Plinio on 29/11/20.
//

import UIKit

class InitialVC: UIViewController {
    
    let logoImageView = UIImageView()
    let nicknameTextField = HMTextField()
    let emailTextField = HMTextField()
    let passwordTextField = HMTextField()
    
    let callToActionButton = HMButton(backgroundColor: .systemGreen, title: "Start Game".uppercased())
    
    var isUsernameEntered: Bool { return !nicknameTextField.text!.isEmpty }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureLogoImageView()
        configureEmailTextField()
        configurePasswordTextField()
        configureNicknameTextField()
        configureCallToActionButton()
        createDismissKeyboardTapgesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    func createDismissKeyboardTapgesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushGameVC() {
        
        guard isUsernameEntered else {
            print("No username...")
            return
        }
        
        let gameVC = GameVC()
        gameVC.username = nicknameTextField.text
        gameVC.title = "Game".uppercased()
        navigationController?.pushViewController(gameVC, animated: true)
    }
    
    func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "hangman-logo")!
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureNicknameTextField() {
        view.addSubview(nicknameTextField)
        nicknameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            nicknameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 80),
            nicknameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nicknameTextField.heightAnchor.constraint(equalToConstant: 50),
            nicknameTextField.widthAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    func configureEmailTextField() {
        view.addSubview(nicknameTextField)
        nicknameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            nicknameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 80),
            nicknameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nicknameTextField.heightAnchor.constraint(equalToConstant: 50),
            nicknameTextField.widthAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    func configurePasswordTextField() {
        view.addSubview(nicknameTextField)
        nicknameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            nicknameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 80),
            nicknameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nicknameTextField.heightAnchor.constraint(equalToConstant: 50),
            nicknameTextField.widthAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        
        callToActionButton.addTarget(self, action: #selector(pushGameVC), for: .touchUpInside)
        
//        callToActionButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            callToActionButton.topAnchor.constraint(equalTo: nicknameTextField.bottomAnchor, constant: 20),
            callToActionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50),
            callToActionButton.widthAnchor.constraint(equalToConstant: 280)
        ])
    }
}


extension InitialVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushGameVC()
        return true
    }
}

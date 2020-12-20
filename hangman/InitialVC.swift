//
//  ViewController.swift
//  hangman
//
//  Created by Rafael Plinio on 29/11/20.
//

import UIKit

class InitialVC: UIViewController {
    
    let logoImageView = UIImageView()
//    let nicknameTextField = HMTextField()
    let emailTextField = HMTextField()
    let passwordTextField = HMTextField()
    let textLabel = HMLabel()
    let alertContainer = HMAlertContainerView()
    
    
    let callToRegisterButton = HMButton(backgroundColor: .systemBlue, title: "Register")
    let callToEnterButton = HMButton(backgroundColor: .systemGreen, title: "Start Game".uppercased())
    
    var isUsernameEntered: Bool { return !emailTextField.text!.isEmpty }
//    var isValidEmail: Bool { return !emailTextField.text!.isValidEmail() }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configureLogoImageView()
        configureEmailTextField()
        configurePasswordTextField()
        configureTextLabel()
        configureRegisterButton()
        configureCallToActionButton()
        createDismissKeyboardTapgesture()
        
        emailTextField.text = "Dummy Name"
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
            print("Vai apresentar o MODAL")
            presentHMAlertOnMainThread(container: alertContainer, title: "No Username", message: "You must be logged in!", buttonTitle: "Ok")
            return
        }
        
//        guard isValidEmail else {
//            presentHMAlertOnMainThread(container: alertContainer, title: "Invalid E-mail", message: "Check your e-mail and try again!", buttonTitle: "Ok")
//            return
//        }
        
        let gameVC = GameVC()
        navigationController?.pushViewController(gameVC, animated: true)
    }
    
    @objc func pushRegisterVC() {
        
        let registerVC = RegisterVC()
        registerVC.title = "Register"
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    
    func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "hangman-logo")!
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureEmailTextField() {
        view.addSubview(emailTextField)
        emailTextField.delegate = self
        emailTextField.placeholder = "E-mail"
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            emailTextField.widthAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    func configurePasswordTextField() {
        view.addSubview(passwordTextField)
        passwordTextField.delegate = self
        passwordTextField.placeholder = "Password"
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.widthAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    func configureTextLabel() {
        view.addSubview(textLabel)
        
        textLabel.text = "Not Registered?"
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.heightAnchor.constraint(equalToConstant: 50),
            textLabel.widthAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    func configureRegisterButton() {
        view.addSubview(callToRegisterButton)
        
        callToRegisterButton.addTarget(self, action: #selector(pushRegisterVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToRegisterButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 5),
            callToRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            callToRegisterButton.heightAnchor.constraint(equalToConstant: 50),
            callToRegisterButton.widthAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    func configureCallToActionButton() {
        view.addSubview(callToEnterButton)
        
        callToEnterButton.addTarget(self, action: #selector(pushGameVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToEnterButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            callToEnterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            callToEnterButton.heightAnchor.constraint(equalToConstant: 50),
            callToEnterButton.widthAnchor.constraint(equalToConstant: 280)
        ])
    }
}


extension InitialVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushGameVC()
        return true
    }
    
//    private func textFieldDidEndEditing(_ textField: HMTextField) {
//        if let emailTextField = textField.text {
//            if emailTextField.isValidEmail() {
//                print("Okay Email go ahead")
//            }else{
//                print("Enter a valid email address first.")
//            }
//        }
//    }
}

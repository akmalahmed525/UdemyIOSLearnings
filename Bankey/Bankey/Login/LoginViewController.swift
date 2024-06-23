//
//  ViewController.swift
//  Bankey
//
//  Created by Akmal on 21/6/2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    let appTitle = UILabel()
    let appSubtitle = UILabel()
    
    let loginView = LoginView()
    let signinButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    var username: String? {
        loginView.usernameTextField.text
    }
    
    var password: String? {
        loginView.passwordTextField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LoginViewController {
    private func style() {
        appTitle.translatesAutoresizingMaskIntoConstraints = false
        appTitle.textAlignment = .center
        appTitle.numberOfLines = 0
        appTitle.text = "Bankey"
        appTitle.font = .systemFont(ofSize: 30, weight: .bold)
        
        appSubtitle.translatesAutoresizingMaskIntoConstraints = false
        appSubtitle.textAlignment = .center
        appSubtitle.numberOfLines = 0
        appSubtitle.text = "Your premium source for all things banking!"
        appSubtitle.font = .systemFont(ofSize: 25, weight: .medium)
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        // The button related constraints!
        signinButton.translatesAutoresizingMaskIntoConstraints = false
        signinButton.configuration = .filled()
        signinButton.configuration?.imagePadding = 8
        signinButton.setTitle("Sign In", for: [])
        signinButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        // Error Message Label
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0 // This is to make the label multi line!
        // errorMessageLabel.text = "Error Failure"
        errorMessageLabel.isHidden = true
    }
    
    private func layout() {
        view.addSubview(appTitle)
        view.addSubview(appSubtitle)
        view.addSubview(loginView)
        view.addSubview(signinButton)
        view.addSubview(errorMessageLabel)
        
        NSLayoutConstraint.activate([
            appTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appTitle.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: appTitle.trailingAnchor, multiplier: 1),
            
            
            appSubtitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appSubtitle.topAnchor.constraint(equalToSystemSpacingBelow: appTitle.bottomAnchor, multiplier: 2),
            appSubtitle.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: appSubtitle.trailingAnchor, multiplier: 1),
            
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: appSubtitle.bottomAnchor, multiplier: 3),
        ])
        
        
        // Login View
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        // Button Constraints!
        NSLayoutConstraint.activate([
            signinButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signinButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signinButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // Error Message Label
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signinButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: signinButton.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: signinButton.trailingAnchor)
        ])
        
    }
}

// To handle login function
extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username, let password else {
            assertionFailure("Username or Password should not be null")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            errorMessageLabel.text = "Username/Password cannot be empty"
            errorMessageLabel.isHidden = false
            return
        }
        
        if username == "Akmal" && password == "Welcome" {
            signinButton.configuration?.showsActivityIndicator = true
        } else {
            errorMessageLabel.text = "Incorrect Username/Password"
            errorMessageLabel.isHidden = false
        }
    }
}


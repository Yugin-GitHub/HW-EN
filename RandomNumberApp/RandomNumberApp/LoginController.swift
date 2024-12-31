//
//  LoginController.swift
//  RandomNumberAPP
//
//  Created by Евгений Волков on 19.12.24.
//

import UIKit

class LoginController: UIViewController {
    private let loginView = LoginView()
    private let authManager = AuthManager()
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        loginView.registerButton.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
    }
    
    @objc private func handleLogin() {
        guard let email = loginView.emailTextField.text, !email.isEmpty,
              let password = loginView.passwordTextField.text, !password.isEmpty else {
            showAlert(message: "Please fill in all fields.")
            return
        }
        
        authManager.loginUser(email: email, password: password) { [weak self] result in
            switch result {
            case .success(let user):
                print("Logged in as \(user.email)")
                // Navigate to home screen
                let homeController = HomeController(userID: user.uid)
                self?.navigationController?.pushViewController(homeController, animated: true)
            case .failure(let error):
                self?.showAlert(message: "Login failed: \(error.localizedDescription)")
            }
        }
    }
    
    @objc private func handleRegister() {
        guard let email = loginView.emailTextField.text, !email.isEmpty,
              let password = loginView.passwordTextField.text, !password.isEmpty else {
            showAlert(message: "Please fill in all fields.")
            return
        }
        
        authManager.registerUser(email: email, password: password) { [weak self] result in
            switch result {
            case .success(let user):
                self?.showAlert(message: "Registration successful for \(user.email).")
            case .failure(let error):
                self?.showAlert(message: "Registration failed: \(error.localizedDescription)")
            }
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}






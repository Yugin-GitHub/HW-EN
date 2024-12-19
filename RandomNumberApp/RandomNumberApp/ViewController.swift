//
//  ViewController.swift
//  RandomNumberAPP
//
//  Created by Евгений Волков on 16.12.24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ViewController: UIViewController {
    
    private let minValueTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Min value"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private let maxValueTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Max value"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private let generateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Generate", for: .normal)
        button.addTarget(self, action: #selector(generateRandomNumber), for: .touchUpInside)
        return button
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Result"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private let historyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("History", for: .normal)
        button.addTarget(self, action: #selector(openHistory), for: .touchUpInside)
        return button
    }()
    
    private var db: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        
        // Настройка Firestore
        db = Firestore.firestore()
    }
    
    private func setupLayout() {
        view.addSubview(minValueTextField)
        view.addSubview(maxValueTextField)
        view.addSubview(generateButton)
        view.addSubview(resultLabel)
        view.addSubview(historyButton)
        
        minValueTextField.translatesAutoresizingMaskIntoConstraints = false
        maxValueTextField.translatesAutoresizingMaskIntoConstraints = false
        generateButton.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        historyButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            minValueTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            minValueTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            minValueTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            maxValueTextField.topAnchor.constraint(equalTo: minValueTextField.bottomAnchor, constant: 20),
            maxValueTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            maxValueTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            generateButton.topAnchor.constraint(equalTo: maxValueTextField.bottomAnchor, constant: 20),
            generateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            resultLabel.topAnchor.constraint(equalTo: generateButton.bottomAnchor, constant: 30),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            historyButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 30),
            historyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func generateRandomNumber() {
        guard let minText = minValueTextField.text, let minValue = Int(minText),
              let maxText = maxValueTextField.text, let maxValue = Int(maxText),
              maxValue > minValue else {
            showErrorAlert(message: "Please enter valid range values.")
            return
        }
        
        let randomNumber = Int.random(in: minValue...maxValue)
        resultLabel.text = "Result: \(randomNumber)"
        
        saveToHistory(number: randomNumber)
    }
    
    private func saveToHistory(number: Int) {
        guard let userID = Auth.auth().currentUser?.uid else {
            showErrorAlert(message: "Unable to save history: User not logged in.")
            return
        }
        
        let data: [String: Any] = [
            "number": number,
            "timestamp": Timestamp(date: Date())
        ]
        
        db.collection("users").document(userID).collection("history").addDocument(data: data) { error in
            if let error = error {
                self.showErrorAlert(message: "Failed to save history: \(error.localizedDescription)")
            }
        }
    }
    
    @objc private func openHistory() {
        let historyVC = HistoryViewController()
        navigationController?.pushViewController(historyVC, animated: true)
    }
    
    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
}


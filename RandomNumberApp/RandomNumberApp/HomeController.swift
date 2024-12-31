//
//  HomeController.swift
//  RandomNumberAPP
//
//  Created by Евгений Волков on 19.12.24.
//

import UIKit

class HomeController: UIViewController {
    private let homeView = HomeView()
    private let randomNumberModel = RandomNumberGenerator()
    private let historyManager = HistoryManager()
    private let userID: String
    
    init(userID: String) {
        self.userID = userID
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = homeView.historyButton
        
        homeView.generateButton.addTarget(self, action: #selector(handleGenerate), for: .touchUpInside)
        homeView.historyButton.target = self
        homeView.historyButton.action = #selector(showHistory)
    }
    
    @objc private func handleGenerate() {
        guard let minText = homeView.minTextField.text, let maxText = homeView.maxTextField.text,
              let min = Int(minText), let max = Int(maxText), min <= max else {
            showAlert(message: "Please enter valid min and max values.")
            return
        }
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            let randomNumber = self?.randomNumberModel.generateRandomNumber(min: min, max: max) ?? 0
            
            // Обновляем интерфейс на главном потоке
            DispatchQueue.main.async {
                self?.homeView.resultLabel.text = "Result: \(randomNumber)"
            }
            
            // Сохраняем историю
            self?.historyManager.saveHistoryRecord(userID: self?.userID ?? "", number: randomNumber) { error in
                if let error = error {
                    DispatchQueue.main.async {
                        self?.showAlert(message: "Failed to save history: \(error.localizedDescription)")
                    }
                }
            }
        }
    }

    
    @objc private func showHistory() {
        let historyController = HistoryController(userID: userID)
        navigationController?.pushViewController(historyController, animated: true)
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}



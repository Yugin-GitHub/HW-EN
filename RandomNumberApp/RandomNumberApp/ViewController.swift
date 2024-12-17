//
//  ViewController.swift
//  RandomNumberAPP
//
//  Created by Евгений Волков on 16.12.24.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth


class ViewController: UIViewController {

    // UI элементы
    private let minTextField = UITextField()
    private let maxTextField = UITextField()
    private let generateButton = UIButton()
    private let resultLabel = UILabel()
    private let historyButton = UIButton()
    private let signInButton = UIButton()
    private let historyLabel = UILabel()

    private var user: User?
    private var history: [String] = []
    private let db = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Установка UI
        setupUI()
        
        // Проверка, если пользователь уже авторизован
        if let user = Auth.auth().currentUser {
            self.user = user
            loadHistory()
        } else {
            self.user = nil
        }
    }

    func setupUI() {
        // Настройка минимального значения
        minTextField.placeholder = "Минимальное значение"
        minTextField.borderStyle = .roundedRect
        minTextField.keyboardType = .numberPad
        minTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(minTextField)

        // Настройка максимального значения
        maxTextField.placeholder = "Максимальное значение"
        maxTextField.borderStyle = .roundedRect
        maxTextField.keyboardType = .numberPad
        maxTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(maxTextField)

        // Кнопка генерации
        generateButton.setTitle("Сгенерировать число", for: .normal)
        generateButton.backgroundColor = .systemBlue
        generateButton.layer.cornerRadius = 10
        generateButton.translatesAutoresizingMaskIntoConstraints = false
        generateButton.addTarget(self, action: #selector(generateNumber), for: .touchUpInside)
        view.addSubview(generateButton)

        // Результат
        resultLabel.text = "Результат: "
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultLabel)

        // История
        historyButton.setTitle("История", for: .normal)
        historyButton.backgroundColor = .systemGreen
        historyButton.layer.cornerRadius = 10
        historyButton.translatesAutoresizingMaskIntoConstraints = false
        historyButton.addTarget(self, action: #selector(showHistory), for: .touchUpInside)
        view.addSubview(historyButton)

        // Кнопка для входа
        signInButton.setTitle("Войти", for: .normal)
        signInButton.backgroundColor = .systemPurple
        signInButton.layer.cornerRadius = 10
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        view.addSubview(signInButton)

        // Подстройка элементов UI с использованием Auto Layout
        NSLayoutConstraint.activate([
            minTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            minTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            minTextField.widthAnchor.constraint(equalToConstant: 200),

            maxTextField.topAnchor.constraint(equalTo: minTextField.bottomAnchor, constant: 20),
            maxTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            maxTextField.widthAnchor.constraint(equalToConstant: 200),

            generateButton.topAnchor.constraint(equalTo: maxTextField.bottomAnchor, constant: 20),
            generateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            generateButton.widthAnchor.constraint(equalToConstant: 200),

            resultLabel.topAnchor.constraint(equalTo: generateButton.bottomAnchor, constant: 20),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            historyButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20),
            historyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            historyButton.widthAnchor.constraint(equalToConstant: 200),

            signInButton.topAnchor.constraint(equalTo: historyButton.bottomAnchor, constant: 20),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

    // Генерация случайного числа
    @objc func generateNumber() {
        guard let minText = minTextField.text, let minValue = Int(minText),
              let maxText = maxTextField.text, let maxValue = Int(maxText), minValue < maxValue else {
            resultLabel.text = "Неверный диапазон!"
            return
        }
        let randomNumber = Int.random(in: minValue...maxValue)
        resultLabel.text = "Результат: \(randomNumber)"
        
        if let user = user {
            saveHistory(number: randomNumber)
        }
    }

    // Сохранение истории в Firestore
    func saveHistory(number: Int) {
        let ref = db.collection("users").document(user!.uid)
        ref.updateData([
            "history": FieldValue.arrayUnion([number])
        ]) { error in
            if let error = error {
                print("Ошибка сохранения истории: \(error)")
            } else {
                print("История сохранена!")
            }
        }
    }

    // Загрузка истории
    func loadHistory() {
        guard let user = user else { return }
        let ref = db.collection("users").document(user.uid)
        ref.getDocument { (document, error) in
            if let document = document, document.exists {
                if let historyArray = document.data()?["history"] as? [Int] {
                    self.history = historyArray.map { "\($0)" }
                }
            } else {
                print("Документ не существует!")
            }
        }
    }

    // Показать историю
    @objc func showHistory() {
        historyLabel.text = history.joined(separator: "\n")
        let alert = UIAlertController(title: "История", message: historyLabel.text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: .default))
        self.present(alert, animated: true)
    }

    // Авторизация пользователя
    @objc func signIn() {
        let alertController = UIAlertController(title: "Войти", message: "Введите email и пароль", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Email"
        }
        alertController.addTextField { textField in
            textField.placeholder = "Пароль"
            textField.isSecureTextEntry = true
        }
        alertController.addAction(UIAlertAction(title: "Войти", style: .default, handler: { _ in
            if let email = alertController.textFields?[0].text, let password = alertController.textFields?[1].text {
                Auth.auth().signIn(withEmail: email, password: password) { result, error in
                    if let error = error {
                        print("Ошибка входа: \(error.localizedDescription)")
                    } else {
                        self.user = result?.user
                        self.loadHistory()
                    }
                }
            }
        }))
        alertController.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        present(alertController, animated: true)
    }
}



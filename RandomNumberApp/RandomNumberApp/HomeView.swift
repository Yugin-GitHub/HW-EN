//
//  HomeView.swift
//  RandomNumberAPP
//
//  Created by Евгений Волков on 19.12.24.
//

import UIKit

class HomeView: UIView {
    // Добавление UIImageView для фона
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "backgroundImageHome")
        return imageView
    }()
    let randomNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Random Generator"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        return label
    }()
    
    let minTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Min Value"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let maxTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Max Value"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let generateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Generate Random Number", for: .normal)
        return button
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Result:"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    let historyButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "History", style: .plain, target: nil, action: nil)
        return button
    }()
    
    // StackView для элементов
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [resultLabel, minTextField, maxTextField, generateButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
        }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
        
    private func setupView() {
        // Добавляем backgroundImageView в качестве фона
        addSubview(backgroundImageView)
        
        addSubview(randomNumberLabel)
        // Добавляем stackView с элементами
        addSubview(stackView)
            
        setupConstraints()
    }
        
    private func setupConstraints() {
        // Constraints для фона
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
            
        NSLayoutConstraint.activate([
            randomNumberLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            randomNumberLabel.topAnchor.constraint(equalTo: topAnchor, constant: 65),
            randomNumberLabel.widthAnchor.constraint(equalToConstant: 250)
        ])
        
        // Constraints для stackView
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),

        // Ограничиваем ширину для stackView, чтобы элементы не растягивались слишком сильно
            stackView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}






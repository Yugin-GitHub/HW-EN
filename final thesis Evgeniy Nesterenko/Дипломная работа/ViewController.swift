//
//  ViewController.swift
//  Дипломная работа
//
//  Created by Евгений Волков on 10.12.24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var minTextField: UITextField!
    @IBOutlet weak var maxTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.image = .image
        minTextField.backgroundColor = .systemGray3
        maxTextField.backgroundColor = .systemGray3
        resultLabel.font = .systemFont(ofSize: 25)
        resultLabel.textColor = .systemGray3

    }
    
    @IBAction func generateRandomNumber( sender: UIButton) {
        
        guard let minText = minTextField.text, let maxText = maxTextField.text,
              let minValue = Int(minText), let maxValue = Int(maxText), minValue < maxValue else {
            resultLabel.text = "Пожалуйста, введите корректный диапазон."
            return
        }
        
        let randomNumber = Int.random(in: minValue...maxValue)
        
        resultLabel.text = "Ваше случайное число: \(randomNumber)"
    }
    
}

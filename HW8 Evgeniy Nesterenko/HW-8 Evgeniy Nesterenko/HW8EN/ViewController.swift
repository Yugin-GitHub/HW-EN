//
//  ViewController.swift
//  HW8EN
//
//  Created by Евгений Волков on 2.07.24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

   
  
    @IBOutlet weak var label: UILabel!
    
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    
    
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var buttonLogIn: UIButton!
    @IBOutlet weak var buttonRegister: UIButton!
    
    @IBOutlet weak var image2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "My Home Control"
        label.font = .systemFont(ofSize: 31)
        label.textColor = .white
        
        userNameLabel.text = "Username"
        userNameTextField.backgroundColor = .white
        userNameTextField.textColor = .black
        
        passwordLabel.text = "Password"
        passwordTextField.backgroundColor = .white
        passwordTextField.textColor = .black
        
        image2.image = .image1
    }


}


//
//  TwoViewController.swift
//  HW8EN
//
//  Created by Евгений Волков on 2.07.24.
//

import UIKit

class TwoViewController: UIViewController {

    @IBOutlet weak var regFormLabel: UILabel!
    
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var confirmPasswordLabel: UILabel!
    
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var image3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        regFormLabel.font = .systemFont(ofSize: 33)
        regFormLabel.textColor = .white
        
        userNameLabel.textColor = .white
        
        passwordLabel.textColor = .white
        
        confirmPasswordLabel.textColor = .white
    
        image3.image = .image2
    }

}

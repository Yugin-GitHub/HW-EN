//
//  ViewController.swift
//  HW9EN
//
//  Created by Евгений Волков on 9.07.24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenGreen = UIViewController()
        let screenYellow = UIViewController()
        
        view.backgroundColor = .systemMint
        screenGreen.view.backgroundColor = .green
        screenYellow.view.backgroundColor = .yellow
        
        navigationController?.pushViewController(screenYellow, animated: true)
        navigationController?.pushViewController(screenGreen, animated: true)
    }
}


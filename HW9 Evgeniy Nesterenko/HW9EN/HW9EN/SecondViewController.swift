//
//  SecondViewController.swift
//  HW9EN
//
//  Created by Евгений Волков on 9.07.24.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {
    lazy var label = UILabel()
    lazy var viewForLabel = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemOrange
        
        viewForLabel.addSubview(label)
        view.addSubview(viewForLabel)
       
        label.text = "Apple Inc.!"
        label.textColor = .white
        label.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
    
        viewForLabel.backgroundColor = .systemBrown
        viewForLabel.layer.cornerRadius = 20
        viewForLabel.layer.borderWidth = 10
        viewForLabel.snp.makeConstraints{
            $0.center.equalTo(view.snp.center)
            $0.height.equalTo(80)
            $0.width.equalTo(240)
        }
       
    }
}

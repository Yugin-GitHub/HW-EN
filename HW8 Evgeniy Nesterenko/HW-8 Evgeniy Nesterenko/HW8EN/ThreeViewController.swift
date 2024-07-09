//
//  ThreeViewController.swift
//  HW8EN
//
//  Created by Евгений Волков on 2.07.24.
//

import UIKit

class ThreeViewController: UIViewController {

    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var controlLabel: UILabel!
    
    
    @IBOutlet weak var lightLabel: UILabel!
    @IBOutlet weak var lightSegCon: UISegmentedControl!
    
    
    @IBOutlet weak var doorLabel: UILabel!
    @IBOutlet weak var doorSegCon: UISegmentedControl!
    
    
    @IBOutlet weak var acLabel: UILabel!
    @IBOutlet weak var acSegCon: UISegmentedControl!
    
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var tepmSlider: UISlider!
    @IBOutlet weak var cLabel: UILabel!
    
    
    @IBOutlet weak var alarmButton: UIButton!
    
    
    @IBOutlet weak var image1: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.font = .systemFont(ofSize: 33)
        welcomeLabel.textColor = .white
        
        controlLabel.font = .systemFont(ofSize: 25)
        controlLabel.textColor = .white
        
        lightLabel.textColor = .white
        
        doorLabel.textColor = .white
        
        acLabel.textColor = .white
        
        tempLabel.textColor = .white
        
        cLabel.textColor = .white
        
        image1.image = .image
    }
    
}

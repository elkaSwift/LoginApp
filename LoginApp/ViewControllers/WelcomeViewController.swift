//
//  HellowViewController.swift
//  LoginApp
//
//  Created by Елисей Мищенко on 15.12.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var hellowLabel: UILabel!
    
    var username = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hellowLabel.text = "\(username)!"
        
        let firstColor = UIColor(red: 148 / 255, green: 83 / 255, blue: 182 / 255, alpha: 1).cgColor
        let secondColor = UIColor(red: 104 / 255, green: 74 / 255, blue: 164 / 255, alpha: 1).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [firstColor, secondColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

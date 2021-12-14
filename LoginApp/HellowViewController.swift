//
//  HellowViewController.swift
//  LoginApp
//
//  Created by Елисей Мищенко on 15.12.2021.
//

import UIKit

class HellowViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let color1 = UIColor(red: 189 / 255, green: 144 / 255, blue: 155 / 255, alpha: 1).cgColor
        let color2 = UIColor(red: 128 / 255, green: 136 / 255, blue: 179 / 255, alpha: 1).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color1, color2]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    
    
}

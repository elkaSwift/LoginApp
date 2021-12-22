//
//  HellowViewController.swift
//  LoginApp
//
//  Created by Елисей Мищенко on 15.12.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var hellowLabel: UILabel!
    @IBOutlet weak var logOut: UIButton!
    
    var username: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hellowLabel.text = "Welcome, \(username.person.fullName)!"
        
            logOut.layer.cornerRadius = 10
            logOut.backgroundColor = .clear
            logOut.layer.cornerRadius = 10
            logOut.layer.borderWidth = 2
            logOut.layer.borderColor = UIColor.white.cgColor
        
        let firstColor = UIColor(red: 245 / 255, green: 200 / 255, blue: 79 / 255, alpha: 1).cgColor
        let secondColor = UIColor(red: 250 / 255, green: 229 / 255, blue: 110 / 255, alpha: 1).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [firstColor, secondColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

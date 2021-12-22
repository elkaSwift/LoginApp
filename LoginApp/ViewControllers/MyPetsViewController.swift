//
//  MyPetsViewController.swift
//  LoginApp
//
//  Created by Елисей Мищенко on 22.12.2021.
//

import UIKit

class MyPetsViewController: UIViewController {

    @IBOutlet weak var owners: UILabel!
    @IBOutlet weak var catButton: UIButton!
    @IBOutlet weak var dogButton: UIButton!
    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var dogImage: UIImageView!
    
    
    
    var ownersName: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        owners.text = "Owner's \(ownersName.person.fullName)!"
        
        catImage.layer.cornerRadius = catImage.bounds.height / 2
        dogImage.layer.cornerRadius = dogImage.bounds.height / 2
        
        catButton.layer.cornerRadius = catButton.bounds.height / 2
        catButton.backgroundColor = .clear
        catButton.layer.cornerRadius = catButton.bounds.height / 2
        catButton.layer.borderWidth = 2
        catButton.layer.borderColor = UIColor.systemYellow.cgColor
        dogButton.layer.cornerRadius = dogButton.bounds.height / 2
        dogButton.backgroundColor = .clear
        dogButton.layer.cornerRadius = dogButton.bounds.height / 2
        dogButton.layer.borderWidth = 2
        dogButton.layer.borderColor = UIColor.systemYellow.cgColor
    }


}

//
//  MyProfileViewController.swift
//  LoginApp
//
//  Created by Елисей Мищенко on 22.12.2021.
//

import UIKit

class MyProfileViewController: UIViewController {

    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var user: UILabel!
    
    
    var username: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.cornerRadius = profileImage.bounds.height / 2
        user.text = "\(username.person.fullName)"
    }

}

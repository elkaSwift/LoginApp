//
//  ViewController.swift
//  LoginApp
//
//  Created by Елисей Мищенко on 14.12.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: IBOutlets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var forgotUserNameButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 10
        logInButton.backgroundColor = .clear
        logInButton.layer.cornerRadius = 10
        logInButton.layer.borderWidth = 2
        logInButton.layer.borderColor = UIColor.systemYellow.cgColor
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    //MARK: Private properties
    private let user = User.getUserData()
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
    
        viewControllers.forEach {
            if let welcomeVC = $0 as? WelcomeViewController {
                welcomeVC.username = user
            } else if let profileVC = $0 as? MyProfileViewController {
                profileVC.username = user
            } else if let navigationPetsVC = $0 as? UINavigationController {
                let dogVC = navigationPetsVC.topViewController as! MyPetsViewController
                dogVC.ownersName = user
            }
        }
    }
    
    //MARK: Transitions
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logIn()
            performSegue(withIdentifier: "welcomVC", sender: nil)
        }
        return true
    }
    
    //MARK: IBActions
    @IBAction func logIn() {
        if userNameTextField.text != user.login || passwordTextField.text != user.password {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: passwordTextField
            )
        }
    }
    
    
    @IBAction func forgotUserName() {
        showAlert(title: "Oops!", message: "Your username is Elisei 🙃")
    }
    
    @IBAction func forgotPassword() {
        showAlert(title: "Oops!", message: "Your password is 12345 🙃")
    }
    
    @IBAction func tap(_ sender: Any) {
        userNameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    @IBAction func unwind(for seque: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
}

// MARK: - Private Methods
extension LoginViewController{
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in textField?.text = "" }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

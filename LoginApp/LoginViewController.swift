//
//  ViewController.swift
//  LoginApp
//
//  Created by Елисей Мищенко on 14.12.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var forgotUserNameButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 10
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    let userName = "Elisei"
    let password = "12345"
    
    @IBAction func logIn() {
        guard let inputText = userNameTextField.text, !inputText.isEmpty else {
            showAlert(title: "Text field is empty", message: "Please enter your username")
            return
        }
        guard let inputText = passwordTextField.text, !inputText.isEmpty else {
            showAlert(title: "Text field is empty", message: "Please enter your password ")
            return
        }
        if userNameTextField.text != userName {
            showAlert(title: "Error in username", message: "Enter the username correctly")
        } else if passwordTextField.text != password {
            showAlert(title: "Error in password", message: "Enter the password correctly")
        }
        
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func forgotUserName() {
        showAlert(title: "Oops!", message: "Your username is Elisei 😉")
    }
    
    @IBAction func forgotPassword() {
        showAlert(title: "Oops!", message: "Your password is 12345 😉")
    }
    
    
    @IBAction func tap(_ sender: Any) {
        userNameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            passwordTextField.becomeFirstResponder()
            return true
        }
    
    @IBAction func unwind(for seque: UIStoryboardSegue) {
    }
}

// MARK: - Private Methods
extension ViewController{
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in self.userNameTextField.text = "" }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

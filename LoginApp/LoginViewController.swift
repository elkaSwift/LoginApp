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
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    //MARK: Private properties
    let user = "Elisei"
    let password = "12345"
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let hellowVC = segue.destination as? WelcomeViewController else { return }
        hellowVC.username = userNameTextField.text ?? ""
    }
    
    //MARK: Transitions
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logIn()
            performSegue(withIdentifier: "Segue", sender: nil)
        }
        return true
    }
    
    //MARK: IBActions
    @IBAction func logIn() {
        if userNameTextField.text != user || passwordTextField.text != password {
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

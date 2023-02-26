//
//  LoginViewController.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 24/2/2023.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func setup() {
        emailTextField.placeholder = "Email/Username"
        passwordTextField.placeholder = "Password"
        emailTextField.text = ""
        passwordTextField.text = ""
        
    }
    
    @IBAction func loginButton(_ sender: Any) {
        print("Login Clicked")
    }
    

}

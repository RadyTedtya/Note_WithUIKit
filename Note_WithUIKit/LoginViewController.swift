//
//  LoginViewController.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 24/2/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginViewModel: LoginViewModel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        emailTextField.placeholder = "Email/Username"
        passwordTextField.placeholder = "Password"
        emailTextField.text = ""
        passwordTextField.text = ""
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self , action: #selector(dismissView))
        title = "Login"
        navigationItem.titleView?.backgroundColor = .secondaryColor
    }
    
    @objc func dismissView() {
        navigationController?.popViewController(animated: true)
    }

    
    @IBAction func loginButton(_ sender: Any) {
        print("Login Clicked")
        loginViewModel.addNewDocument()
    }
    

    @IBAction func registerButton(_ sender: Any) {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
}

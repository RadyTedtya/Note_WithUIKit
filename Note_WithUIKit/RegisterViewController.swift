//
//  RegisterViewController.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 24/2/2023.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var loginViewModel: LoginViewModel = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setup() {
        emailTextField.placeholder = "Email"
        usernameTextField.placeholder = "Username"
        passwordTextField.placeholder = "Password"
        emailTextField.text = ""
        usernameTextField.text = ""
        passwordTextField.text = ""
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self , action: #selector(dismissView))
        title = "Registration"
        
    }
    
    @objc func dismissView() {
        navigationController?.popViewController(animated: true)
    }
    
    

    @IBAction func registerButton(_ sender: Any) {
        loginViewModel.addNewDocument()
    }
    
}

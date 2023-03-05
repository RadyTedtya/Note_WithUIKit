//
//  LoginViewController.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 24/2/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let _viewModel: LoginViewModel! = .init()
    
<<<<<<< HEAD
=======
    var user: User! = .initUser
    
>>>>>>> c0d73cce155aa2660f0ec4c92b6ef949ec43d157
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        emailTextField.placeholder = "Email/Username"
        passwordTextField.placeholder = "Password"
        emailTextField.text = "test1@gmail.com"
        passwordTextField.text = "test123"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self , action: #selector(dismissView))
        title = "Login"
        navigationItem.titleView?.backgroundColor = .secondaryColor
    }
    
    @objc func dismissView() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func loginButton(_ sender: Any) {
<<<<<<< HEAD
        _viewModel.user.email = emailTextField!.text?.lowercased()
        _viewModel.user.password = passwordTextField!.text?.lowercased()
        _viewModel.loginUser()
        if NoteApp.shared.isLogin {
            print("Login Success")
            navigationController?.popViewController(animated: true)
        } else {
            navigationController?.pushViewController(LoginViewController(), animated: true)
        }
=======
        print("Login Clicked")
        user.email = emailTextField!.text?.lowercased() ?? ""
        user.password = passwordTextField!.text?.lowercased() ?? ""
        _viewModel.loginResult = _viewModel.loginUser(user: user)
        print("Login Result: \(_viewModel.loginResult)")
        
        print()
>>>>>>> c0d73cce155aa2660f0ec4c92b6ef949ec43d157
    }

    @IBAction func registerButton(_ sender: Any) {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
}

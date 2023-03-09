//
//  LoginViewController.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 24/2/2023.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    private let _viewModel: LoginViewModel! = .init()
    var isLoading: Bool = false
    var alert = UIAlertController(title: "Title", message: nil, preferredStyle: .alert)

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
        isLoading = true
        _viewModel.user.email = emailTextField!.text?.lowercased()
        _viewModel.user.password = passwordTextField!.text?.lowercased()
        _viewModel.loginUser(closure: {
            if NoteApp.shared.isLogin {
                self.alert.title = "Login Success"
                let alertAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                    self.navigationController?.popViewController(animated: true)
                }
                self.alert.addAction(alertAction)
                self.present(self.alert, animated: true, completion: nil)
            } else {
                self.alert.title = "Login Fail"
                let alertAction = UIAlertAction(title: "OK", style: .default)
                self.alert.addAction(alertAction)
                self.present(self.alert, animated: true, completion: nil)
            }
        })
    }
    
    @IBAction func registerButton(_ sender: Any) {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
}

//
//  RegisterViewController.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 24/2/2023.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var loginViewModel: LoginViewModel!
    var _viewModel: ContentViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                let homeVC = UINavigationController(rootViewController: HomeViewController())
                homeVC.modalPresentationStyle = .fullScreen
                self.present(homeVC, animated: true)
            }
        }
    }
    
}

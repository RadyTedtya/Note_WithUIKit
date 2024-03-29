//
//  LoginViewController.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 24/2/2023.

//    primary acc     Username: test1@gmail.com   Password: test123
//    secondary acc   Username: test2@gmail.com   Password: password


import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    var loginViewModel: LoginViewModel = .init()
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
        moveToHome()
    }
    
    @IBAction func loginButton(_ sender: Any) {
        isLoading = true
        loginViewModel.user.email = emailTextField!.text?.lowercased()
        loginViewModel.user.password = passwordTextField!.text?.lowercased()
        loginViewModel.loginUser(loginClosure: {
            if NoteApp.shared.isLogin {
                self.alert.title = "Login Success"
                let alertAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                    self.moveToHome()
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
    
    func moveToHome() {
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        homeViewController.modalPresentationStyle = .fullScreen
        homeViewController.navigationBar.backgroundColor = .primaryBackgroundColor
        self.present(homeViewController, animated: true)
    }
    
    @IBAction func registerButton(_ sender: Any) {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
}

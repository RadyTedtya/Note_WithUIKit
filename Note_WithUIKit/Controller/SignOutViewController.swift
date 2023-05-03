//
//  SignOutViewController.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 3/3/2023.
//

import UIKit
import FirebaseAuth

class SignOutViewController: UIViewController {
    
    let alert = UIAlertController(title: "Sign out result", message: "Signed out", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(moveToHome))
    }
    
    @IBAction func signOutUser(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            NoteApp.shared.isLogin = false
            let alertAction = UIAlertAction(title: "OK", style: .default) {_ in
                self.moveToHome()
            }
            alert.addAction(alertAction)
            self.present(alert, animated: true)
            
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    @objc func moveToHome() {
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        homeViewController.modalPresentationStyle = .fullScreen
        homeViewController.navigationBar.backgroundColor = .primaryBackgroundColor
        self.present(homeViewController, animated: true)
    }
    
    
}


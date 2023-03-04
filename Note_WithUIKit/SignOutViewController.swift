//
//  SignOutViewController.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 3/3/2023.
//

import UIKit
import FirebaseAuth

class SignOutViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()   
    }
    
    @IBAction func signOutUser(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            print("Successfully signed out")
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}

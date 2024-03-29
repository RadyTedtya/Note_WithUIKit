//
//  LoginViewModel.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 26/2/2023.
//

import Foundation
import UIKit
import FirebaseFirestore
import FirebaseAuth


class LoginViewModel {
    
    var loginResult: Bool = NoteApp.shared.isLogin
    var isLoading: Bool = false
    var user: User! = .initUser
    
    func loginUser(loginClosure: @escaping () ->()) {
        Auth.auth().signIn(withEmail: self.user.email, password: self.user.password) { authResult, error in
            defer { self.isLoading = false; loginClosure(); print("userID: \(NoteApp.shared.uid)")}
            if authResult != nil {
                self.loginResult = true
                NoteApp.shared.isLogin = true
                NoteApp.shared.uid = Auth.auth().currentUser?.uid ?? ""
            } else {
                self.loginResult = false
                NoteApp.shared.isLogin = false
            }
        }
    }
    
    func signOutUser() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            NoteApp.shared.isLogin = false
            NoteApp.shared.uid = ""
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        print("User login status: \(loginResult)")
    }
    
    
    //    func registerUser(user: User) -> Bool {
    //        Auth.auth().createUser(withEmail: user.email, password: user.password) { authResult, error in
    //            if let error = error {
    //                print("Error: \(error)")
    //                return false
    //            } else {
    //                return true
    //            }
    //        }
    //    }
    
    
    
    
    
    
}

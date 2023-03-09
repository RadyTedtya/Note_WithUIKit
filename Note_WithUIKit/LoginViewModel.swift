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
    var db: Firestore!
    var handle: AuthStateDidChangeListenerHandle!
    var user: User! = .initUser
    
    func loginUser(closure: @escaping () ->()) {
        Auth.auth().signIn(withEmail: self.user.email, password: self.user.password) { authResult, error in
            defer { self.isLoading = false; closure() }
            if authResult != nil {
                self.loginResult = true
                NoteApp.shared.isLogin = true
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
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        print("User login status: \(loginResult)")
    }
    
    func firebaseSetup() {
        //[Start Firebase setup]
        let setting = FirestoreSettings()
        Firestore.firestore().settings = setting
        //[End setup]
        db = Firestore.firestore()
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
    
    //Add new document with generated ID
    func addNewDocument() {
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: [
            "email":"ted@gmail.com",
            "username":"ted",
            "password":"12345"
        ]) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
            
        }
    }
    
    
    
    
}

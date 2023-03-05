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
    
<<<<<<< HEAD
    var loginResult: Bool = ({
        return Auth.auth().currentUser
    }() != nil)
    
    var db: Firestore!
    var handle: AuthStateDidChangeListenerHandle!
    var user: User! = .initUser
=======
    var loginResult: Bool = false
    var db: Firestore!
    var handle: AuthStateDidChangeListenerHandle!
    var user: User!
>>>>>>> c0d73cce155aa2660f0ec4c92b6ef949ec43d157
    
    func firebaseSetup() {
        //[Start Firebase setup]
        let setting = FirestoreSettings()
        Firestore.firestore().settings = setting
        //[End setup]
        db = Firestore.firestore()
    }
    
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
    
<<<<<<< HEAD
    func loginUser() {
        Auth.auth().signIn(withEmail: user.email, password: user.password) { authResult, error in
            if let error = error {
                print("Error: \(error)")
            } else {
                NoteApp.shared.isLogin = true
                print("Login success in loginUser in LoginViewModel")
            }
        }
=======
    func loginUser(user: User) -> Bool {
>>>>>>> c0d73cce155aa2660f0ec4c92b6ef949ec43d157
        
        Auth.auth().createUser(withEmail: user.email, password: user.password) { authResult, error in
            if let error = error {
                print("Error: \(error)")
            } else {
                self.loginResult = true
            }
        }
        return loginResult
    }
    
<<<<<<< HEAD
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
    
    
    
=======
    func signOutUser(user: User) -> Bool {
        let firebaseAuth = Auth.auth()
          do {
            try firebaseAuth.signOut()
              return loginResult == false
          } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
              return loginResult == true
          }
    }
    
    
>>>>>>> c0d73cce155aa2660f0ec4c92b6ef949ec43d157
    
}

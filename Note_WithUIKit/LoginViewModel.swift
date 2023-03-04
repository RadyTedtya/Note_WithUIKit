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

class LoginViewModel: ObservableObject {
    
    var loginResult: Bool = false
    var db: Firestore!
    var handle: AuthStateDidChangeListenerHandle!
    var user: User!
    
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
    
    func loginUser(user: User) -> Bool {
        
        Auth.auth().createUser(withEmail: user.email, password: user.password) { authResult, error in
            if let error = error {
                print("Error: \(error)")
            } else {
                self.loginResult = true
            }
        }
        return loginResult
    }
    
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
    
    
    
}

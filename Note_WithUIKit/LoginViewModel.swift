//
//  LoginViewModel.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 26/2/2023.
//

import Foundation
import UIKit
import FirebaseFirestore

class LoginViewModel: ObservableObject {
    
    
    var db: Firestore!
    
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
    
    //Add new user
    func addNewUser() {
        
    }
    
}

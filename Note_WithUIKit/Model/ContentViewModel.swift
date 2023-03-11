//
//  ContentViewModel.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 10/3/2023.
//

import Foundation
import UIKit
import FirebaseFirestore

class ContentViewModel {
    var db: Firestore!

    
    init() {
        firebaseSetup()
    }
    
    func createNote() {
        print("Create Note")
    }
    
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
}


class testContentViewModel {
    
    let collection = Firestore.firestore().collection("notes")
    
    var note = Note.dummyImageNote

    func addDoc() {
//        collection.addDocument(data: note.dictionary)
    }
    
    
}

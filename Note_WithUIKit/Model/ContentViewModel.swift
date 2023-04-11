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
    var notes: [Note] = []
    
    
    
    init() {
        firebaseSetup()
        populateData()
    }
    
    func filteredNotes(fortype type: NoteType) -> [Note] {
        print(notes.filter { $0.noteType == type })
        return notes.filter { $0.noteType == type }
    }
    
    func createNote() {
        let note: Note! = .init()
        notes.append(note)
    }
    
}


extension ContentViewModel {
    
    //populate test data
    func populateData() {
        notes = []
        for _ in 1...4 {
            notes.append(Note.dummyAudioNote)
            notes.append(Note.dummyImageNote)
            notes.append(Note.dummyReminderNote)
        }
    }
    
    
    
    
    
    //Firebase Setup
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


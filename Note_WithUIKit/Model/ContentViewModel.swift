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
        let note: Note! = .init(Note.dummyImageNote)
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
    
    //Firebase: Setup firestore
    func firebaseSetup() {
        //[Start Firebase setup]
        let setting = FirestoreSettings()
        Firestore.firestore().settings = setting
        //[End setup]
        db = Firestore.firestore()
    }
    
    //Firebase: write data in firebase
    func writeToFirebase(note: Note) {
        let ref = db.collection("Note")
        ref.addDocument(data: [
            "title": note.title ?? "",
            "date": note.date ?? "",
            "noteType": note.noteType.rawValue,
            "image": note.image ?? "",
            "audio": note.audio ?? "",
            "description": note.description ?? ""
        ]) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Document added with ID: \(ref.collectionID)")
            }
            
        }
    }
    
    //Firebase: Delete firebase collection
    func deleteFirebaseCollection() {
        db.collection("Notes").document("P0Grj0WvReMPtAl9CfTU").delete() { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Successfully deleted collection")
            }
        }
    }
    
    func readFromFirebaseWithClosure(closure: @escaping ()->()) {
        notes.removeAll()
        let ref = db.collection("Note")
        ref.getDocuments() { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    defer { print("Completed fetching data..."); closure()  }
                    let data = document.data()
                    let id = data["id"] as? Int ?? 0
                    let title = data["title"] as? String ?? ""
                    let date = data["date"] as? String ?? ""
                    let audio = data["audio"] as? String ?? ""
                    let image = data["image"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    let type = data["noteType"] as? String ?? ""
                    let noteType: NoteType = {
                        switch type.lowercased() {
                        case "image":
                            return NoteType.imageNote
                        case "audio":
                            return NoteType.audioNote
                        case "reminder":
                            return NoteType.reminderNote
                        default:
                            return NoteType.reminderNote
                        }
                    }()
                    let newNote: Note = .init(id: id, title: title, date: date, noteType: noteType, audio: audio, image: image, description: description)
                    self.notes.append(newNote)
                }
            }
        }
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


//
//  Note.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 20/2/2023.
//

import Foundation

enum NoteType: String, CaseIterable, Identifiable {
    
    var id: Self {
        return self
    }
    case allNotes = "All Notes"
    case audioNote = "Audio"
    case reminderNote = "Reminder"
    case imageNote = "Image"
}

struct Note: Identifiable {
    var id: Int
    var title: String!
    var date: String!
    var noteType: NoteType!
    var audio: String?
    var image: String?
    var description: String?
    
    var dictionary: [String: Any] {
        return [
            "id" : id,
            "title": title!,
            "date": date!,
            "noteType": noteType!,
            "audio": audio!,
            "image": image!,
            "description": description!,
        ]
    }
    
    
    
}

extension Note {
    
    static let description = "Tum dicere exorsus est laborum et via procedat oratio quaerimus igitur, quid sit. Si sine causa? quae fuerit causa, mox videro; interea hoc tenebo, si ob……"
    
    static let dummyImageNote: Note = .init(id: 1, title: "summer vacation", date: "12 Jan 2021", noteType: .imageNote, audio: nil, image: "image", description: "Tum dicere exorsus est laborum et via procedat oratio quaerimus igitur, quid sit. Si sine causa? quae fuerit causa, mox videro; interea hoc tenebo, si ob……")
    
    static let dummyAudioNote: Note = .init(id: 1, title: "winter vacation", date: "12 Dec 2017", noteType: .audioNote, audio: "", image: nil, description: description)
    
    static let dummyReminderNote: Note = .init(id: 1, title: "winter vacation", date: "12 Dec 2017", noteType: .reminderNote, audio: nil, image: nil, description: description)
}



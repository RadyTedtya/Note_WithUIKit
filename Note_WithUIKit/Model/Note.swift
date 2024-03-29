//
//  Note.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 20/2/2023.
//

import Foundation
import UIKit

enum NoteType: String, CaseIterable, Identifiable, CodingKey {
    
    var id: Self {
        return self
    }
    case allNotes = "All Notes"
    case audioNote = "Audio"
    case reminderNote = "Reminder"
    case imageNote = "Image"
    
    static var noteTypes: [String] {
        return NoteType.allCases.map { $0.rawValue }
    }
}

struct Note: Identifiable {
    var id: Int
    var title: String!
    var date: String!
    var noteType: NoteType!
    var audio: String?
    var image: String?
    var description: String?
    var uid: String?


    static let description = "Tum dicere exorsus est laborum et via procedat oratio quaerimus igitur, quid sit. Si sine causa? quae fuerit causa, mox videro; interea hoc tenebo, si ob……"

    static let dummyImageNote: Note = .init(id: 1, title: "Summer vacation", date: "12 Jan 2021", noteType: .imageNote, audio: nil, image: "image", description: "Tum dicere exorsus est laborum et via procedat oratio quaerimus igitur, quid sit. Si sine causa? quae fuerit causa, mox videro; interea hoc tenebo, si ob……", uid: "")

    static let dummyAudioNote: Note = .init(id: 2, title: "Winter vacation", date: "05 June 2004", noteType: .audioNote, audio: "", image: nil, description: description, uid: "")

    static let dummyReminderNote: Note = .init(id: 3, title: "Spring vacation", date: "28 Dec 2017", noteType: .reminderNote, audio: nil, image: nil, description: description, uid: "")
}



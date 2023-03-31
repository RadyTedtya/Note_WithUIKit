//
//  ShareResult.swift
//  Note_WithUIKit
//
//  Created by Tedtya rady on 4/3/2023.
//

import Foundation

class NoteApp {
    
    var isLogin: Bool = false
    
    var selectedType: NoteType = .allNotes
    
    static let shared = NoteApp()
    
    private init() {
         
    }
    
}
